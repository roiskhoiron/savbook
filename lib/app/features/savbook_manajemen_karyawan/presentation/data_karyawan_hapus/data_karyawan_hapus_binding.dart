import 'package:get/get.dart';

import 'data_karyawan_hapus_logic.dart';

class DataKaryawanHapusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataKaryawanHapusLogic());
  }
}
