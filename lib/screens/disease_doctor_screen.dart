import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/disease_doctor_provider.dart';
import '../providers/locale_provider.dart';
import '../ml/disease_classifier.dart';
import '../widgets/glassmorphic_card.dart';
import '../widgets/language_selector_button.dart';
import '../l10n/app_strings.dart';

class DiseaseDoctorScreen extends ConsumerStatefulWidget {
  const DiseaseDoctorScreen({super.key});

  @override
  ConsumerState<DiseaseDoctorScreen> createState() => _DiseaseDoctorScreenState();
}

class _DiseaseDoctorScreenState extends ConsumerState<DiseaseDoctorScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _selectedImagePath;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
      // Fire Isolate Inference execution from Riverpod
      ref.read(diseaseDoctorProvider.notifier).analyzeImage(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLang = ref.watch(localeProvider);

    // Listen for inference completions and trigger UI alerts for rejection classes
    ref.listen<AsyncValue<ResultData?>>(diseaseDoctorProvider, (previous, next) {
      next.whenData((result) {
        if (result == null) return;

        if (result.predictedLabel == 'Not_A_Plant') {
          _showRejectionDialog(
            context: context,
            title: AppStrings.tr('invalid_image_title', currentLang),
            message: AppStrings.tr('invalid_image_msg', currentLang),
            icon: Icons.image_not_supported_rounded,
            accentColor: const Color(0xFFE53935),
            currentLang: currentLang,
          );
        } else if (result.predictedLabel == 'Other_Leaves') {
          _showRejectionDialog(
            context: context,
            title: AppStrings.tr('unsupported_plant_title', currentLang),
            message: AppStrings.tr('unsupported_plant_msg', currentLang),
            icon: Icons.eco_outlined,
            accentColor: const Color(0xFFFB8C00),
            currentLang: currentLang,
          );
        } else if (result.isLowConfidence) {
          _showRejectionDialog(
            context: context,
            title: AppStrings.tr('uncertain_result_title', currentLang),
            message: AppStrings.tr('uncertain_result_msg', currentLang),
            icon: Icons.help_outline_rounded,
            accentColor: const Color(0xFFE65100),
            currentLang: currentLang,
          );
        }
      });
    });

    final analyzeState = ref.watch(diseaseDoctorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tr('dr_leaf_title', currentLang)),
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Preview Region
            GestureDetector(
              onTap: () => _pickImage(ImageSource.gallery),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1.5),
                  image: _selectedImagePath != null
                      ? DecorationImage(
                          image: FileImage(File(_selectedImagePath!)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _selectedImagePath == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_a_photo, size: 50, color: Color(0xFF2E7D32)),
                          const SizedBox(height: 12),
                          Text(
                            AppStrings.tr('tap_add_photo', currentLang),
                            style: const TextStyle(color: Color(0xFF1B5E20), fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 32),

            // Riverpod State Handling
            analyzeState.when(
              data: (ResultData? result) {
                if (result == null) {
                  return Center(
                    child: Text(
                      AppStrings.tr('select_photo_hint', currentLang),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  );
                }
                // Halt disease detail screen navigation when an invalid image or unsupported plant is scanned
                if (result.isRejection) {
                  return _buildRejectionNoticeCard(result, currentLang);
                }
                return _buildResultCard(result, currentLang);
              },
              error: (err, stack) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Error during inference: $err",
                  style: TextStyle(color: Colors.red.shade900),
                ),
              ),
              loading: () => Column(
                children: [
                  const CircularProgressIndicator(color: Color(0xFF2E7D32)),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.tr('analyzing_plant', currentLang),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF43A047), Color(0xFF1B5E20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B5E20).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () => _pickImage(ImageSource.camera),
          icon: const Icon(Icons.camera_alt, color: Colors.white),
          label: Text(
            AppStrings.tr('scan_field', currentLang),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
        ),
      ),
    );
  }

  void _showRejectionDialog({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    required Color accentColor,
    required AppLanguage currentLang,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: GlassmorphicCard(
            padding: const EdgeInsets.all(24),
            borderRadius: 24,
            backgroundColor: Colors.white.withValues(alpha: 0.95),
            borderColor: accentColor.withValues(alpha: 0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: accentColor.withValues(alpha: 0.3), width: 2),
                  ),
                  child: Icon(icon, size: 40, color: accentColor),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    color: Color(0xFF37474F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B5E20),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                    icon: const Icon(Icons.center_focus_strong, color: Colors.white),
                    label: Text(
                      AppStrings.tr('scan_again', currentLang),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRejectionNoticeCard(ResultData result, AppLanguage currentLang) {
    final String title;
    final String message;
    final IconData icon;
    final Color accentColor;

    if (result.isNotAPlant) {
      title = AppStrings.tr('invalid_image_title', currentLang);
      message = AppStrings.tr('invalid_image_msg', currentLang);
      icon = Icons.image_not_supported_rounded;
      accentColor = const Color(0xFFE53935);
    } else if (result.isOtherLeaves) {
      title = AppStrings.tr('unsupported_plant_title', currentLang);
      message = AppStrings.tr('unsupported_plant_msg', currentLang);
      icon = Icons.warning_amber_rounded;
      accentColor = const Color(0xFFFB8C00);
    } else {
      title = AppStrings.tr('uncertain_result_title', currentLang);
      message = AppStrings.tr('uncertain_result_msg', currentLang);
      icon = Icons.help_outline_rounded;
      accentColor = const Color(0xFFE65100);
    }

    return GlassmorphicCard(
      padding: const EdgeInsets.all(20),
      borderColor: accentColor.withValues(alpha: 0.4),
      backgroundColor: accentColor.withValues(alpha: 0.08),
      child: Row(
        children: [
          Icon(
            icon,
            color: accentColor,
            size: 36,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: Color(0xFF455A64),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(ResultData result, AppLanguage currentLang) {
    final localizedDiseaseName = AppStrings.getDiseaseDisplayName(result.predictedLabel, currentLang);
    final localizedCause = AppStrings.getDiseaseCause(result.predictedLabel, currentLang);
    final localizedCure = AppStrings.getDiseaseCure(result.predictedLabel, currentLang);
    final confidencePercent = (result.confidence * 100).toStringAsFixed(0);

    return GlassmorphicCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.medical_information, color: Color(0xFF2E7D32)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "$localizedDiseaseName ($confidencePercent%)",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20)),
                ),
              ),
            ],
          ),
          const Divider(height: 32, color: Colors.white54),
          _buildSection(Icons.science, AppStrings.tr('cause', currentLang), localizedCause),
          const SizedBox(height: 16),
          _buildSection(Icons.healing, AppStrings.tr('cure', currentLang), localizedCure),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Chip(
                backgroundColor: const Color(0xFFE8F5E9),
                side: BorderSide.none,
                label: Text(
                  '${AppStrings.tr('confidence', currentLang)}: ${(result.confidence * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(IconData icon, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 6),
        Text(content, style: const TextStyle(fontSize: 16, height: 1.4)),
      ],
    );
  }
}
