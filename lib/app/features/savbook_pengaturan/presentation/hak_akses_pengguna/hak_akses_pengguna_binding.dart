import 'package:get/get.dart';

import 'hak_akses_pengguna_logic.dart';

class HakAksesPenggunaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HakAksesPenggunaLogic());
  }
}
