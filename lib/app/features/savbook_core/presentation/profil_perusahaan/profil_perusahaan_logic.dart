import 'package:get/get.dart';

import 'profil_perusahaan_state.dart';

class ProfilPerusahaanLogic extends GetxController {
  final ProfilPerusahaanState state = ProfilPerusahaanState();

  @override
  void onInit() {
    _fetchInfo();
    super.onInit();
  }

  void _fetchInfo() async {
    // final res = await _app.getProfilPerusahaan();
  }
}
