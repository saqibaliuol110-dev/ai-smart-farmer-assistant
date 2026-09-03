import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import '../ml/disease_classifier.dart';

final diseaseDoctorProvider =
    AsyncNotifierProvider<DiseaseDoctorNotifier, ResultData?>(
      DiseaseDoctorNotifier.new,
    );

class DiseaseDoctorNotifier extends AsyncNotifier<ResultData?> {
  List<String>? _labels;
  Uint8List? _modelBytes; // Store the model in memory
  Future<void>? _loadFuture;

  @override
  Future<ResultData?> build() async {
    // Kick off model and labels loading asynchronously when provider/screen initializes
    _loadModelAndLabels();
    return null;
  }

  Future<void> _loadModelAndLabels() {
    _loadFuture ??= _performLoad();
    return _loadFuture!;
  }

  Future<void> _performLoad() async {
    try {
      if (_labels == null) {
        final labelsContent = await rootBundle.loadString(
          'assets/models/disease_labels.txt',
        );
        _labels = labelsContent
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }

      if (_modelBytes == null) {
        final modelData = await rootBundle.load(
          'assets/models/disease_model_89_68_float16.tflite',
        );
        _modelBytes = modelData.buffer.asUint8List();
      }
    } catch (e) {
      // Clear the future cache so we can attempt to load again if a failure occurs
      _loadFuture = null;
      rethrow;
    }
  }

  Future<void> analyzeImage(String imagePath) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // Ensure the model and labels are fully loaded
      await _loadModelAndLabels();

      if (_labels == null || _modelBytes == null) {
        throw Exception("Model or labels not properly loaded.");
      }

      // Run inference inside background isolate
      return await DiseaseClassifier.runInference(
        imagePath,
        _labels!,
        _modelBytes!,
      );
    });
  }
}
