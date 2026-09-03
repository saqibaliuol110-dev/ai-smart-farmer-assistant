class CropModel {
  final String name;
  final String description;
  final String sowingSeason; // NEW
  final String harvestTime;  // NEW
  final double minN, maxN; 
  final double minP, maxP; 
  final double minK, maxK; 
  final double minPh, maxPh; 
  final double minTemp, maxTemp; 

  CropModel({
    required this.name,
    required this.description,
    required this.sowingSeason,
    required this.harvestTime,
    required this.minN,
    required this.maxN,
    required this.minP,
    required this.maxP,
    required this.minK,
    required this.maxK,
    required this.minPh,
    required this.maxPh,
    required this.minTemp,
    required this.maxTemp,
  });
}
