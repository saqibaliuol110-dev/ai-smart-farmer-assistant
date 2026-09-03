import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/crop_database.dart';
import '../models/crop_model.dart';
import '../providers/locale_provider.dart';
import '../widgets/glassmorphic_card.dart';
import '../widgets/modern_button.dart';
import '../widgets/language_selector_button.dart';
import '../l10n/app_strings.dart';

class CropRecommendationScreen extends ConsumerStatefulWidget {
  const CropRecommendationScreen({super.key});

  @override
  ConsumerState<CropRecommendationScreen> createState() =>
      _CropRecommendationScreenState();
}

class _CropRecommendationScreenState
    extends ConsumerState<CropRecommendationScreen> {
  // UI State: Toggle between Visual (false) and Lab Data (true)
  bool _isAdvancedMode = false;

  // --- LAB DATA STATE (Advanced) ---
  double _n = 80;
  double _p = 40;
  double _k = 40;
  double _ph = 6.5;
  double _temp = 25;

  // --- VISUAL WIZARD STATE (Quick Guide) ---
  String _selectedSoil = 'Loamy';
  String _selectedSeason = 'Summer';

  // Results List
  List<Map<String, dynamic>> _recommendations = [];

  void _calculateRecommendations() {
    double finalN, finalP, finalK, finalPh, finalTemp;

    if (_isAdvancedMode) {
      finalN = _n;
      finalP = _p;
      finalK = _k;
      finalPh = _ph;
      finalTemp = _temp;
    } else {
      if (_selectedSoil == 'Sandy') {
        finalN = 60;
        finalP = 30;
        finalK = 30;
        finalPh = 6.0;
      } else if (_selectedSoil == 'Clay') {
        finalN = 120;
        finalP = 45;
        finalK = 45;
        finalPh = 5.5;
      } else {
        // Loamy (Default/Ideal)
        finalN = 100;
        finalP = 50;
        finalK = 40;
        finalPh = 6.8;
      }

      finalTemp = (_selectedSeason == 'Summer') ? 32.0 : 18.0;
    }

    setState(() {
      _recommendations = CropDatabase.recommendCrops(
        n: finalN,
        p: finalP,
        k: finalK,
        ph: finalPh,
        temp: finalTemp,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLang = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tr('crop_rec_title', currentLang)),
        actions: const [
          LanguageSelectorButton(),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF43A047), Color(0xFF1B5E20)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- THE DUAL MODE TOGGLE ---
            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                fillColor: const Color(0xFF2E7D32),
                selectedColor: Colors.white,
                color: const Color(0xFF1B5E20),
                isSelected: [!_isAdvancedMode, _isAdvancedMode],
                onPressed: (index) {
                  setState(() {
                    _isAdvancedMode = index == 1;
                    _recommendations.clear();
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(AppStrings.tr('quick_guide', currentLang)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(AppStrings.tr('lab_data', currentLang)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- INPUT SECTION ---
            _isAdvancedMode
                ? _buildAdvancedForm(currentLang)
                : _buildVisualWizard(currentLang),

            const SizedBox(height: 24),

            // --- ACTION BUTTON ---
            ModernButton(
              text: AppStrings.tr('find_best_crops', currentLang),
              onPressed: _calculateRecommendations,
              borderRadius: 30,
            ),
            const SizedBox(height: 32),

            // --- RESULTS SECTION ---
            if (_recommendations.isNotEmpty) ...[
              Text(
                AppStrings.tr('top_recommendations', currentLang),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ..._recommendations.map((result) {
                final CropModel crop = result['crop'];
                final match = result['match'] as double;

                final localizedCropName =
                    AppStrings.getCropName(crop.name, currentLang);
                final localizedCropDesc =
                    AppStrings.getCropDescription(crop.name, currentLang);
                final localizedCropSeason =
                    AppStrings.getCropSeason(crop.name, currentLang);
                final localizedCropHarvest =
                    AppStrings.getCropHarvestTime(crop.name, currentLang);

                return GlassmorphicCard(
                  borderRadius: 16,
                  padding: EdgeInsets.zero,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFC8E6C9),
                      child: Icon(Icons.grass, color: Color(0xFF1B5E20)),
                    ),
                    title: Text(
                      localizedCropName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizedCropDesc.isNotEmpty
                                ? localizedCropDesc
                                : crop.description,
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                size: 16,
                                color: Color(0xFF2E7D32),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  localizedCropSeason.isNotEmpty
                                      ? localizedCropSeason
                                      : crop.sowingSeason,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                size: 16,
                                color: Color(0xFF2E7D32),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "${AppStrings.tr('harvest_in', currentLang)} ${localizedCropHarvest.isNotEmpty ? localizedCropHarvest : crop.harvestTime}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: match >= 80
                              ? [const Color(0xFF43A047), const Color(0xFF1B5E20)]
                              : [Colors.orange.shade400, Colors.orange.shade800],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${match.toInt()}% ${AppStrings.tr('match', currentLang)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ] else if (_recommendations.isEmpty && _isAdvancedMode) ...[
              Center(
                child: Text(
                  AppStrings.tr('click_to_recommend', currentLang),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // --- WIDGET: VISUAL WIZARD ---
  Widget _buildVisualWizard(AppLanguage currentLang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.tr('soil_question', currentLang),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _visualChoiceButton(
              AppStrings.tr('sandy', currentLang),
              AppStrings.tr('sandy_sub', currentLang),
              _selectedSoil == 'Sandy',
              () => setState(() => _selectedSoil = 'Sandy'),
            ),
            _visualChoiceButton(
              AppStrings.tr('loamy', currentLang),
              AppStrings.tr('loamy_sub', currentLang),
              _selectedSoil == 'Loamy',
              () => setState(() => _selectedSoil = 'Loamy'),
            ),
            _visualChoiceButton(
              AppStrings.tr('clay', currentLang),
              AppStrings.tr('clay_sub', currentLang),
              _selectedSoil == 'Clay',
              () => setState(() => _selectedSoil = 'Clay'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          AppStrings.tr('season_question', currentLang),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _visualChoiceButton(
              AppStrings.tr('summer', currentLang),
              AppStrings.tr('kharif', currentLang),
              _selectedSeason == 'Summer',
              () => setState(() => _selectedSeason = 'Summer'),
            ),
            _visualChoiceButton(
              AppStrings.tr('winter', currentLang),
              AppStrings.tr('rabi', currentLang),
              _selectedSeason == 'Winter',
              () => setState(() => _selectedSeason = 'Winter'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _visualChoiceButton(
    String title,
    String subtitle,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC8E6C9) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF2E7D32) : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? const Color(0xFF1B5E20) : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET: LAB DATA ---
  Widget _buildAdvancedForm(AppLanguage currentLang) {
    return GlassmorphicCard(
      borderRadius: 16,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSlider(
              AppStrings.tr('nitrogen', currentLang),
              _n,
              0,
              200,
              (val) => setState(() => _n = val),
            ),
            _buildSlider(
              AppStrings.tr('phosphorus', currentLang),
              _p,
              0,
              100,
              (val) => setState(() => _p = val),
            ),
            _buildSlider(
              AppStrings.tr('potassium', currentLang),
              _k,
              0,
              100,
              (val) => setState(() => _k = val),
            ),
            _buildSlider(
              AppStrings.tr('soil_ph', currentLang),
              _ph,
              0,
              14,
              (val) => setState(() => _ph = val),
              isDecimal: true,
            ),
            _buildSlider(
              AppStrings.tr('temperature', currentLang),
              _temp,
              0,
              50,
              (val) => setState(() => _temp = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged, {
    bool isDecimal = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(
              isDecimal ? value.toStringAsFixed(1) : value.toInt().toString(),
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: const Color(0xFF2E7D32),
          inactiveColor: const Color(0xFFC8E6C9),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
