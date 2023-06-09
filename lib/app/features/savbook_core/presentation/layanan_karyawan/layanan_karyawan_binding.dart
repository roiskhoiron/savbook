import 'package:get/get.dart';

import 'layanan_karyawan_logic.dart';

class LayananKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayananKaryawanLogic());
  }
}
