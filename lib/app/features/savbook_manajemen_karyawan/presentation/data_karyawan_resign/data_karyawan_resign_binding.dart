import 'package:get/get.dart';

import 'data_karyawan_resign_logic.dart';

class DataKaryawanResignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataKaryawanResignLogic());
  }
}
