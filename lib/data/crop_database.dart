import '../models/crop_model.dart';

class CropDatabase {
  static final List<CropModel> localCrops = [
    CropModel(
      name: "Cotton",
      description:
          "A major cash crop best suited for warm climates and well-drained loamy soil.",
      sowingSeason: "April - May (Kharif)",
      harvestTime: "150 - 180 Days",
      minN: 100,
      maxN: 140,
      minP: 30,
      maxP: 60,
      minK: 30,
      maxK: 50,
      minPh: 5.8,
      maxPh: 8.0,
      minTemp: 22,
      maxTemp: 35,
    ),
    CropModel(
      name: "Rice",
      description:
          "Requires high water retention and heavy clay soils. Ideal for monsoon season.",
      sowingSeason: "May - June (Kharif)",
      harvestTime: "120 - 150 Days",
      minN: 80,
      maxN: 120,
      minP: 35,
      maxP: 55,
      minK: 35,
      maxK: 45,
      minPh: 5.5,
      maxPh: 7.0,
      minTemp: 20,
      maxTemp: 35,
    ),
    CropModel(
      name: "Wheat",
      description:
          "A staple winter crop. Thrives in moderate temperatures and well-drained soils.",
      sowingSeason: "Nov - Dec (Rabi)",
      harvestTime: "120 - 140 Days",
      minN: 60,
      maxN: 100,
      minP: 40,
      maxP: 60,
      minK: 40,
      maxK: 50,
      minPh: 6.0,
      maxPh: 7.5,
      minTemp: 10,
      maxTemp: 25,
    ),
    CropModel(
      name: "Sugarcane",
      description:
          "A long-duration cash crop requiring fertile soil and abundant canal water.",
      sowingSeason: "Feb - Mar / Sep",
      harvestTime: "10 - 12 Months",
      minN: 110,
      maxN: 150,
      minP: 40,
      maxP: 60,
      minK: 45,
      maxK: 65,
      minPh: 6.5,
      maxPh: 7.5,
      minTemp: 20,
      maxTemp: 35,
    ),
    CropModel(
      name: "Maize (Corn)",
      description: "A versatile crop that requires nitrogen-rich loamy soil.",
      sowingSeason: "Jul - Aug (Kharif)",
      harvestTime: "90 - 120 Days",
      minN: 80,
      maxN: 120,
      minP: 40,
      maxP: 60,
      minK: 30,
      maxK: 50,
      minPh: 5.5,
      maxPh: 7.5,
      minTemp: 18,
      maxTemp: 30,
    ),
    CropModel(
      name: "Mustard (Sarson)",
      description:
          "An oilseed winter crop requiring low water and cooler temperatures.",
      sowingSeason: "Oct - Nov (Rabi)",
      harvestTime: "110 - 140 Days",
      minN: 40,
      maxN: 80,
      minP: 20,
      maxP: 40,
      minK: 20,
      maxK: 40,
      minPh: 6.0,
      maxPh: 7.5,
      minTemp: 10,
      maxTemp: 25,
    ),
    CropModel(
      name: "Banana",
      description:
          "A highly profitable fruit crop requiring constant moisture and rich soil.",
      sowingSeason: "Feb - March",
      harvestTime: "11 - 12 Months",
      minN: 150,
      maxN: 200,
      minP: 50,
      maxP: 80,
      minK: 100,
      maxK: 150,
      minPh: 6.5,
      maxPh: 7.5,
      minTemp: 15,
      maxTemp: 35,
    ),
    CropModel(
      name: "Mung Bean (Moong)",
      description:
          "A short-duration legume that naturally fixes nitrogen in the soil.",
      sowingSeason: "March / July",
      harvestTime: "60 - 70 Days",
      minN: 10,
      maxN: 30,
      minP: 30,
      maxP: 50,
      minK: 20,
      maxK: 40,
      minPh: 6.2,
      maxPh: 7.2,
      minTemp: 25,
      maxTemp: 35,
    ),
    CropModel(
      name: "Chilli",
      description:
          "A high-value spice crop requiring warm weather and well-drained soil.",
      sowingSeason: "Feb - March",
      harvestTime: "150 - 180 Days",
      minN: 100,
      maxN: 120,
      minP: 40,
      maxP: 60,
      minK: 40,
      maxK: 60,
      minPh: 6.0,
      maxPh: 7.0,
      minTemp: 20,
      maxTemp: 30,
    ),
    CropModel(
      name: "Onion",
      description: "A bulb vegetable that thrives in loose, sandy loam soils.",
      sowingSeason: "Oct - Nov",
      harvestTime: "120 - 150 Days",
      minN: 80,
      maxN: 100,
      minP: 40,
      maxP: 60,
      minK: 60,
      maxK: 80,
      minPh: 6.0,
      maxPh: 7.5,
      minTemp: 15,
      maxTemp: 30,
    ),
    CropModel(
      name: "Tomato",
      description:
          "A high-demand vegetable requiring well-drained soil and good phosphorus levels.",
      sowingSeason: "Sep - Nov / Feb - Mar",
      harvestTime: "70 - 90 Days",
      minN: 80,
      maxN: 120,
      minP: 50,
      maxP: 80,
      minK: 80,
      maxK: 120,
      minPh: 6.0,
      maxPh: 7.0,
      minTemp: 18,
      maxTemp: 29,
    ),
    CropModel(
      name: "Okra (Bhindi)",
      description:
          "A warm-weather vegetable crop that thrives in sandy to loamy soils.",
      sowingSeason: "Feb - Mar / Jun - Jul",
      harvestTime: "60 - 70 Days",
      minN: 60,
      maxN: 100,
      minP: 30,
      maxP: 50,
      minK: 40,
      maxK: 60,
      minPh: 6.0,
      maxPh: 6.8,
      minTemp: 25,
      maxTemp: 35,
    ),
    CropModel(
      name: "Eggplant (Brinjal)",
      description:
          "A hardy vegetable crop that grows well in warm climates and rich soil.",
      sowingSeason: "Jan - Feb / Jun - Jul",
      harvestTime: "100 - 120 Days",
      minN: 100,
      maxN: 150,
      minP: 50,
      maxP: 80,
      minK: 50,
      maxK: 80,
      minPh: 5.5,
      maxPh: 6.8,
      minTemp: 21,
      maxTemp: 30,
    ),
  ];

  static List<Map<String, dynamic>> recommendCrops({
    required double n,
    required double p,
    required double k,
    required double ph,
    required double temp,
  }) {
    List<Map<String, dynamic>> recommendations = [];

    for (var crop in localCrops) {
      // 🚀 THE FIX: Strict Temperature Filter
      // Agar user ka temperature fasal ke min ya max temperature se bahar hai,
      // toh us fasal ko foran reject kar do (continue loop).
      if (temp < crop.minTemp || temp > crop.maxTemp) {
        continue;
      }

      int score = 0;
      // Ab max score 4 hai kyunke temperature pehle hi pass ho chuka hai
      int maxScore = 4;

      if (n >= crop.minN && n <= crop.maxN) score++;
      if (p >= crop.minP && p <= crop.maxP) score++;
      if (k >= crop.minK && k <= crop.maxK) score++;
      if (ph >= crop.minPh && ph <= crop.maxPh) score++;

      double matchPercentage = (score / maxScore) * 100;

      // Agar mitti ki conditions 50% (ya us se zyada) match karti hain, tabhi recommend karein
      if (matchPercentage >= 50.0) {
        recommendations.add({'crop': crop, 'match': matchPercentage});
      }
    }

    // Sort from highest match to lowest
    recommendations.sort((a, b) => b['match'].compareTo(a['match']));
    return recommendations;
  }
}
