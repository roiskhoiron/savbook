import 'package:get/get.dart';

import '../../application/data_karyawan_app_service.dart';
import '../../infrastructure/datasource/data_karyawan_remote_data_source.dart';
import '../../infrastructure/repository/data_karyawan_repository.dart';
import 'data_karyawan_logic.dart';

class DataKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    /*MODUL SAVBOOK MANAJEMEN KARYAWAN*/
    // infrastructure dependencies
    Get.put(DataKaryawanRemoteDataSource());
    // Get.put(DataKaryawanFactory());
    Get.put(DataKaryawanRepository());
    // aplication dependencies
    Get.put(DataKaryawanAppService());
    // presentation dependencies
    Get.lazyPut(() => DataKaryawanLogic());
  }
}
