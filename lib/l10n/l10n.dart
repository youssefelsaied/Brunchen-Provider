import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'π¦πͺ';
      case 'en':
        return 'πΊπΈ';
      default:
        return 'πΊπΈ';
    }
  }
}
