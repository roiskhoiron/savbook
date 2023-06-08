import 'package:get/get.dart';

import 'data_karyawan_logic.dart';

class DataKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataKaryawanLogic());
  }
}
