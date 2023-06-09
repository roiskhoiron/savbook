import 'package:get/get.dart';

import 'daftar_persetujuan_logic.dart';

class DaftarPersetujuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DaftarPersetujuanLogic());
  }
}
