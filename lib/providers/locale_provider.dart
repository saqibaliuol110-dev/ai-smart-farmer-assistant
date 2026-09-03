import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage {
  english,
  urdu,
  sindhi;

  String get code {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.urdu:
        return 'ur';
      case AppLanguage.sindhi:
        return 'sd';
    }
  }

  String get displayName {
    switch (this) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.urdu:
        return 'اردو';
      case AppLanguage.sindhi:
        return 'سنڌي';
    }
  }

  String get flag {
    switch (this) {
      case AppLanguage.english:
        return '🇬🇧';
      case AppLanguage.urdu:
        return '🇵🇰';
      case AppLanguage.sindhi:
        return '🌾';
    }
  }

  bool get isRtl => this == AppLanguage.urdu || this == AppLanguage.sindhi;

  TextDirection get textDirection =>
      isRtl ? TextDirection.rtl : TextDirection.ltr;

  Locale get locale => Locale(code);

  static AppLanguage fromCode(String? code) {
    switch (code) {
      case 'ur':
        return AppLanguage.urdu;
      case 'sd':
        return AppLanguage.sindhi;
      case 'en':
      default:
        return AppLanguage.english;
    }
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, AppLanguage>(LocaleNotifier.new);

class LocaleNotifier extends Notifier<AppLanguage> {
  static const String _storageKey = 'selected_language_code';

  @override
  AppLanguage build() {
    _loadPersistedLanguage();
    return AppLanguage.english;
  }

  Future<void> _loadPersistedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(_storageKey);
      if (code != null) {
        state = AppLanguage.fromCode(code);
      }
    } catch (_) {
      // Fallback to default English
    }
  }

  Future<void> setLanguage(AppLanguage language) async {
    state = language;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_storageKey, language.code);
    } catch (_) {}
  }
}
