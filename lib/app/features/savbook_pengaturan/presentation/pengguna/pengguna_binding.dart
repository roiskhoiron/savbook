import 'package:get/get.dart';

import 'pengguna_logic.dart';

class PenggunaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PenggunaLogic());
  }
}
