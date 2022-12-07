import 'dart:io';

import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  static String defaultLocale = Platform.localeName.substring(0,2);
  Locale _locale = Locale(defaultLocale);

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('en');
    notifyListeners();
  }
}
