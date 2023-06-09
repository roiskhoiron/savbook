import 'package:get/get.dart';

import '../../application/profil_perusahaan_app_service.dart';
import '../../infrastructure/datasource/profil_perusahaan_remote_data_source.dart';
import '../../infrastructure/repository/profil_perusahaan_repository.dart';
import 'profil_perusahaan_logic.dart';

class ProfilPerusahaanBinding extends Bindings {
  @override
  void dependencies() {
    /*MODULE SAVEBOOK CORE*/
    // infrastructure dependencies
    Get.put(ProfilPerusahaanRemoteDataSource());
    // Get.put(ProfilPerusahaanFactory());
    Get.put(ProfilPerusahaanRepository());
    // aplication dependencies
    Get.put(ProfilPerusahaanAppService());
    // presentation dependencies
    Get.lazyPut(() => ProfilPerusahaanLogic());
  }
}
