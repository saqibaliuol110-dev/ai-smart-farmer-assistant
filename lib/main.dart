import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/locale_provider.dart';
import 'screens/welcome_splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AgriTechApp()));
}

class AgriTechApp extends ConsumerWidget {
  const AgriTechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(localeProvider);

    TextTheme getTextTheme() {
      if (currentLang == AppLanguage.urdu ||
          currentLang == AppLanguage.sindhi) {
        return GoogleFonts.notoSansArabicTextTheme(ThemeData.light().textTheme);
      }
      return GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme);
    }

    return MaterialApp(
      title: 'AgriTech Edge AI',
      debugShowCheckedModeBanner: false,
      locale: currentLang.locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ur', ''),
        Locale('sd', ''),
      ],
      localizationsDelegates: const [
        _SindhiMaterialLocalizationsDelegate(),
        _SindhiCupertinoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F8F4),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF1B5E20),
        ),
        textTheme: getTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 8,
          indicatorColor: const Color(0xFFE8F5E9),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Color(0xFF1B5E20), size: 26);
            }
            return IconThemeData(color: Colors.grey.shade500, size: 24);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Color(0xFF1B5E20),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
            }
            return TextStyle(color: Colors.grey.shade600, fontSize: 12);
          }),
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: currentLang.textDirection,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const WelcomeSplashScreen(),
    );
  }
}

/// Fallback MaterialLocalizations delegate for Sindhi ('sd')
class _SindhiMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _SindhiMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'sd';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return await GlobalMaterialLocalizations.delegate.load(const Locale('ur'));
  }

  @override
  bool shouldReload(_SindhiMaterialLocalizationsDelegate old) => false;
}

/// Fallback CupertinoLocalizations delegate for Sindhi ('sd')
class _SindhiCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _SindhiCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'sd';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return await GlobalCupertinoLocalizations.delegate.load(const Locale('ur'));
  }

  @override
  bool shouldReload(_SindhiCupertinoLocalizationsDelegate old) => false;
}
