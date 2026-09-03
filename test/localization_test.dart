import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/providers/locale_provider.dart';
import 'package:app/l10n/app_strings.dart';
import 'package:app/data/crop_database.dart';
import 'package:app/main.dart';
import 'package:app/screens/main_shell_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('Language switching, directionality and all transition combinations test', () async {
    final container = ProviderContainer();

    // 1. Default should be English (LTR)
    expect(container.read(localeProvider), AppLanguage.english);
    expect(container.read(localeProvider).isRtl, false);
    expect(container.read(localeProvider).textDirection, TextDirection.ltr);

    // 2. English -> Urdu (RTL)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.urdu);
    expect(container.read(localeProvider), AppLanguage.urdu);
    expect(container.read(localeProvider).isRtl, true);
    expect(container.read(localeProvider).textDirection, TextDirection.rtl);

    // 3. Urdu -> Sindhi (RTL)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.sindhi);
    expect(container.read(localeProvider), AppLanguage.sindhi);
    expect(container.read(localeProvider).isRtl, true);
    expect(container.read(localeProvider).textDirection, TextDirection.rtl);

    // 4. Sindhi -> English (LTR)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.english);
    expect(container.read(localeProvider), AppLanguage.english);
    expect(container.read(localeProvider).isRtl, false);
    expect(container.read(localeProvider).textDirection, TextDirection.ltr);

    // 5. English -> Sindhi (RTL)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.sindhi);
    expect(container.read(localeProvider), AppLanguage.sindhi);

    // 6. Sindhi -> Urdu (RTL)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.urdu);
    expect(container.read(localeProvider), AppLanguage.urdu);

    // 7. Urdu -> English (LTR)
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.english);
    expect(container.read(localeProvider), AppLanguage.english);
  });

  test('Sindhi persistence after restart test', () async {
    SharedPreferences.setMockInitialValues({'selected_language_code': 'sd'});
    final container = ProviderContainer();

    // Build the provider initially (defaults to English before async prefs load)
    expect(container.read(localeProvider), AppLanguage.english);
    // Let async loader run
    await Future.delayed(const Duration(milliseconds: 50));
    final loaded = container.read(localeProvider);

    expect(loaded, AppLanguage.sindhi);
    expect(loaded.isRtl, true);
    expect(loaded.textDirection, TextDirection.rtl);

    // Now change to English and verify SharedPreferences update
    await container.read(localeProvider.notifier).setLanguage(AppLanguage.english);
    expect(container.read(localeProvider), AppLanguage.english);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('selected_language_code'), 'en');
  });

  test('Disease label and clinical info translation test', () {
    const internalLabels = [
      'Cotton_Bacterial_Blight',
      'Cotton_Diseased',
      'Cotton_Healthy',
      'Not_A_Plant',
      'Other_Leaves',
      'Rice_Brown_Spot',
      'Rice_Healthy',
      'Rice_Leaf_Blast',
      'Tomato_Early_Blight',
      'Tomato_Healthy',
      'Tomato_Late_Blight',
      'Wheat_Brown_Rust',
      'Wheat_Healthy',
      'Wheat_Yellow_Rust',
    ];

    for (final label in internalLabels) {
      final en = AppStrings.getDiseaseDisplayName(label, AppLanguage.english);
      final ur = AppStrings.getDiseaseDisplayName(label, AppLanguage.urdu);
      final sd = AppStrings.getDiseaseDisplayName(label, AppLanguage.sindhi);

      expect(en.isNotEmpty, true, reason: 'Missing English display name for $label');
      expect(ur.isNotEmpty, true, reason: 'Missing Urdu display name for $label');
      expect(sd.isNotEmpty, true, reason: 'Missing Sindhi display name for $label');

      final causeEn = AppStrings.getDiseaseCause(label, AppLanguage.english);
      final causeUr = AppStrings.getDiseaseCause(label, AppLanguage.urdu);
      final causeSd = AppStrings.getDiseaseCause(label, AppLanguage.sindhi);

      expect(causeEn.isNotEmpty, true);
      expect(causeUr.isNotEmpty, true);
      expect(causeSd.isNotEmpty, true);

      final cureEn = AppStrings.getDiseaseCure(label, AppLanguage.english);
      final cureUr = AppStrings.getDiseaseCure(label, AppLanguage.urdu);
      final cureSd = AppStrings.getDiseaseCure(label, AppLanguage.sindhi);

      expect(cureEn.isNotEmpty, true);
      expect(cureUr.isNotEmpty, true);
      expect(cureSd.isNotEmpty, true);
    }
  });

  test('Crop database and multilingual recommendation test', () {
    final results = CropDatabase.recommendCrops(
      n: 100,
      p: 50,
      k: 40,
      ph: 6.5,
      temp: 28,
    );

    expect(results.isNotEmpty, true);

    for (final res in results) {
      final crop = res['crop'];
      final nameEn = AppStrings.getCropName(crop.name, AppLanguage.english);
      final nameUr = AppStrings.getCropName(crop.name, AppLanguage.urdu);
      final nameSd = AppStrings.getCropName(crop.name, AppLanguage.sindhi);

      expect(nameEn.isNotEmpty, true);
      expect(nameUr.isNotEmpty, true);
      expect(nameSd.isNotEmpty, true);
    }
  });

  testWidgets('AgriTechApp renders correctly in Sindhi mode with bottom navigation and language dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeProvider.overrideWith(() => _SindhiTestNotifier()),
        ],
        child: const AgriTechApp(),
      ),
    );
    await tester.pump();

    // Verify Sindhi Welcome Screen text
    expect(find.text('ايگري ٽيڪ ايج اي آءِ'), findsOneWidget);

    // Now test MainShellScreen directly in Sindhi mode with AgriTechApp structure
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeProvider.overrideWith(() => _SindhiTestNotifier()),
        ],
        child: const MaterialApp(
          locale: Locale('sd'),
          home: MainShellScreen(),
        ),
      ),
    );
    await tester.pump();

    // Verify NavigationBar destinations in Sindhi
    expect(find.text('فصل سفارش'), findsOneWidget);
    expect(find.text('ڊاڪٽر ليف'), findsOneWidget);
  });
}

class _SindhiTestNotifier extends LocaleNotifier {
  @override
  AppLanguage build() => AppLanguage.sindhi;
}
