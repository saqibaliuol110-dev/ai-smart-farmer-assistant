import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/navigation_provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import 'crop_recommendation_screen.dart';
import 'disease_doctor_screen.dart';

class MainShellScreen extends ConsumerWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);
    final currentLang = ref.watch(localeProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CropRecommendationScreen(),
          DiseaseDoctorScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          ref.read(navigationIndexProvider.notifier).index = index;
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.agriculture_outlined),
            selectedIcon: const Icon(Icons.agriculture),
            label: AppStrings.tr('nav_crop_rec', currentLang),
          ),
          NavigationDestination(
            icon: const Icon(Icons.local_hospital_outlined),
            selectedIcon: const Icon(Icons.local_hospital),
            label: AppStrings.tr('nav_dr_leaf', currentLang),
          ),
        ],
      ),
    );
  }
}
