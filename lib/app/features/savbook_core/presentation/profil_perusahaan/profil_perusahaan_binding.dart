import 'package:get/get.dart';

import 'profil_perusahaan_logic.dart';

class ProfilPerusahaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilPerusahaanLogic());
  }
}
