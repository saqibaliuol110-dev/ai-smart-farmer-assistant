import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/foundation.dart';

class ResultData {
  final String predictedLabel;
  final String diseaseName;
  final String cause;
  final String cure;
  final double confidence;

  ResultData({
    required this.predictedLabel,
    required this.diseaseName,
    required this.cause,
    required this.cure,
    required this.confidence,
  });

  bool get isNotAPlant => predictedLabel == 'Not_A_Plant';
  bool get isOtherLeaves => predictedLabel == 'Other_Leaves';
  bool get isLowConfidence => !isNotAPlant && !isOtherLeaves && confidence < 0.60;
  bool get isRejection => isNotAPlant || isOtherLeaves || isLowConfidence;
}

class InferenceTask {
  final String imagePath;
  final List<String> labels;
  final Uint8List modelBytes;

  InferenceTask(this.imagePath, this.labels, this.modelBytes);
}

class DiseaseClassifier {
  static const int inputSize = 224;

  // Premium database of causes and cures for each class
  static const Map<String, Map<String, String>> _diseaseInfo = {
    'Cotton_Bacterial_Blight': {
      'cause':
          'Pathogen Xanthomonas citri pv. malvacearum. Spread by water splashes, wind-blown rain, or contaminated seeds.',
      'cure':
          'Use acid-delinted seed, plant resistant varieties, and apply copper-based fungicides when symptoms appear.',
    },
    'Cotton_Diseased': {
      'cause':
          'General fungal/bacterial leaf spot infections or nutrient deficiencies.',
      'cure':
          'Monitor fields, remove infected leaves, ensure proper crop rotation, and apply broad-spectrum bio-fungicides.',
    },
    'Cotton_Healthy': {
      'cause':
          'Excellent crop management, proper irrigation, balanced soil nutrients, and robust plant genetics.',
      'cure':
          'No treatment required. Maintain current watering schedule and soil nutrition.',
    },
    'Not_A_Plant': {
      'cause': 'The scanned image does not contain a recognized crop leaf.',
      'cure':
          'This does not appear to be a crop leaf. Please scan a valid plant leaf.',
    },
    'Other_Leaves': {
      'cause': 'The scanned leaf belongs to an unsupported plant species.',
      'cure':
          'Our app currently only supports Tomato, Rice, Wheat, and Cotton. Please scan one of these crops.',
    },
    'Rice_Brown_Spot': {
      'cause':
          'Fungus Bipolaris oryzae (formerly Helminthosporium oryzae). Often associated with nutrient-deficient or water-stressed soils.',
      'cure':
          'Apply balanced NPK fertilizers (especially potassium), improve water drainage, and use certified disease-free seeds.',
    },
    'Rice_Healthy': {
      'cause':
          'Ideal soil moisture, optimized nitrogen levels, and healthy nursery preparation.',
      'cure':
          'No treatment required. Keep monitoring water levels and apply scheduled fertilizer.',
    },
    'Rice_Leaf_Blast': {
      'cause':
          'Fungus Magnaporthe oryzae (anamorph Pyricularia oryzae). Thrives in high humidity, warm nights, and excessive nitrogen.',
      'cure':
          'Avoid excessive nitrogen fertilizer, maintain consistent water depth, and apply systemic fungicides like Tricyclazole if needed.',
    },
    'Tomato_Early_Blight': {
      'cause':
          'Fungus Alternaria solani. Thrives in warm, humid conditions; overwinters in crop debris and soil.',
      'cure':
          'Practice crop rotation, prune lower branches to improve airflow, mulch around plants, and apply copper fungicides weekly.',
    },
    'Tomato_Healthy': {
      'cause':
          'Good plant spacing, dry foliage watering (drip irrigation), and nutrient-rich soil.',
      'cure':
          'No treatment required. Keep watering at the base of the plant to prevent leaf wetness.',
    },
    'Tomato_Late_Blight': {
      'cause':
          'Oomycete Phytophthora infestans. Highly destructive, thrives in cool, wet weather.',
      'cure':
          'Immediately destroy infected plants, use certified disease-free transplants, and apply preventative chlorothalonil or copper fungicides.',
    },
    'Wheat_Brown_Rust': {
      'cause':
          'Fungus Puccinia triticina. Air-borne spores spread quickly in warm (15-22°C) and humid conditions.',
      'cure':
          'Grow rust-resistant cultivars, sow early, and apply triazole fungicides (e.g., Tebuconazole) if infection exceeds threshold.',
    },
    'Wheat_Healthy': {
      'cause':
          'Resistant wheat cultivars, early sowing, and optimal nitrogen-potassium ratio.',
      'cure':
          'No treatment required. Maintain regular field inspection and weed management.',
    },
    'Wheat_Yellow_Rust': {
      'cause':
          'Fungus Puccinia striiformis. Air-borne spores, favors cooler temperatures (10-15°C) and dew.',
      'cure':
          'Plant resistant varieties, monitor fields in early spring, and apply systemic fungicides like Propiconazole immediately upon detection.',
    },
  };

  /// Runs the ML pipeline inside a Dart Isolate
  static Future<ResultData> runInference(
    String imagePath,
    List<String> labels,
    Uint8List modelBytes,
  ) async {
    return compute(
      _isolateInference,
      InferenceTask(imagePath, labels, modelBytes),
    );
  }

  /// Executed in the Background Isolate (NO UI code allowed here!)
  static Future<ResultData> _isolateInference(InferenceTask task) async {
    // 1. Decode and Resize Image
    final bytes = File(task.imagePath).readAsBytesSync();
    final originalImage = img.decodeImage(bytes);

    if (originalImage == null) {
      throw Exception('Failed to decode image');
    }

    final resizedImage = img.copyResize(
      originalImage,
      width: inputSize,
      height: inputSize,
      interpolation: img.Interpolation.linear,
    );

    // 2. Build 4D Input Tensor [1, 224, 224, 3]
    //
    // IMPORTANT:
    // The new TFLite model already contains MobileNetV2 preprocessing
    // internally. Therefore Flutter must provide raw RGB pixel values
    // in the [0, 255] range.
    var input = List.generate(
      1,
      (i) => List.generate(
        inputSize,
        (y) => List.generate(inputSize, (x) {
          final pixel = resizedImage.getPixel(x, y);

          return [pixel.r.toDouble(), pixel.g.toDouble(), pixel.b.toDouble()];
        }),
      ),
    );

    // 3. Build 2D Output Tensor [1, num_classes]
    var output = List.generate(1, (i) => List.filled(task.labels.length, 0.0));

    // 4. Run Inference
    final interpreter = Interpreter.fromBuffer(task.modelBytes);

    interpreter.run(input, output);

    // 5. Safely Parse Output Probabilities
    final probabilities = output[0];

    int maxIdx = 0;
    double maxScore = probabilities[0];

    for (int i = 1; i < probabilities.length; i++) {
      if (probabilities[i] > maxScore) {
        maxScore = probabilities[i];
        maxIdx = i;
      }
    }

    interpreter.close();

    // 6. Map to UI Result Data
    final rawLabel = task.labels[maxIdx];
    final predictedLabel = rawLabel.split('|')[0].trim();

    // Check minimum confidence threshold (0.60) for plant diseases
    // IF predicted class == "Not_A_Plant": keep invalid/non-plant handling
    // ELSE IF predicted class == "Other_Leaves": keep unsupported-leaf handling
    // ELSE IF top confidence < 0.60: do NOT show any disease diagnosis
    if (predictedLabel != 'Not_A_Plant' &&
        predictedLabel != 'Other_Leaves' &&
        maxScore < 0.60) {
      return ResultData(
        predictedLabel: predictedLabel,
        diseaseName: "Unable to identify reliably",
        cause: "Low confidence scan",
        cure: "Please retake a clear photo of the affected plant leaf.",
        confidence: maxScore,
      );
    }

    // Format both the predicted disease name and confidence percentage
    final confidencePercent = (maxScore * 100).toStringAsFixed(0);
    final formattedName = predictedLabel.replaceAll('_', ' ');
    final diseaseWithConfidence = "$formattedName ($confidencePercent%)";

    // Lookup cause and cure
    final info =
        _diseaseInfo[predictedLabel] ??
        {'cause': 'Unknown Cause', 'cure': 'No Cure specified'};

    return ResultData(
      predictedLabel: predictedLabel,
      diseaseName: diseaseWithConfidence,
      cause: info['cause']!,
      cure: info['cure']!,
      confidence: maxScore,
    );
  }
}
