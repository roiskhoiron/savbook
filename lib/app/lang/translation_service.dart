import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_usa.dart';
import 'id_ind.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US'); // default languange

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}
