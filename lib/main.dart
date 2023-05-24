import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:savbook/utility/shared/utils/web_scroll_behavior.dart';

import 'app/lang/translation_service.dart';
import 'app/theme/theme_data.dart';
import 'core/app_route.dart';
import 'core/binding.dart';

// void main() => Production();
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  var isProduction = dotenv.get('IS_PRODUCTION') == 'true';
  var appName = dotenv.get('APP_NAME');

  final myApp = GetMaterialApp(
    showPerformanceOverlay: false,
    debugShowCheckedModeBanner: false,
    enableLog: !isProduction,
    getPages: [AppRouter.routes],
    initialRoute: AppRouter.initial,
    defaultTransition: Transition.noTransition,
    initialBinding: AppBinding(),
    scrollBehavior: WebScrollBehavior(),
    title: appName,
    color: Colors.white,
    themeMode: ThemeMode.light,
    theme: ThemeConfig.lightTheme,
    darkTheme: ThemeConfig.darkTheme,
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
    translations: TranslationService(),
  );

  runApp(myApp);
}

// class Production extends Env {
//   @override
//   final String appName = 'Savbok';
//   @override
//   final String baseUrl = 'https://chat.callink.id'; //prod primary server
//   @override
//   final String tnc = 'https://chat.callink.id/tnc'; //prod tnc site url
//   @override
//   final Color primarySwatch = Colors.teal;
//   @override
//   final EnvType environmentType = EnvType.production;
//
//   @override
//   final String dbName = 'savbook.db';
// }
