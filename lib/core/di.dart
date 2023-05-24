// import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';

import '../utility/shared/services/services.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService.init());
  }
}
