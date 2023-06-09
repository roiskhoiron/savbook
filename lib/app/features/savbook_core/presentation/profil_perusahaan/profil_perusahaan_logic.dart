import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/application/profil_perusahaan_app_service.dart';

import 'profil_perusahaan_state.dart';

class ProfilPerusahaanLogic extends GetxController {
  final ProfilPerusahaanState state = ProfilPerusahaanState();
  final _app = Get.find<ProfilPerusahaanAppService>();

  @override
  void onInit() {
    _fetchInfo();
    super.onInit();
  }

  void _fetchInfo() async {
    final res = await _app.getProfilPerusahaan();
    res.fold((l) {
      // TODO: handle error
    }, (r) {
      state.visi.value = r.data.visi;
      state.misi.value = r.data.misi;
      state.tentang.value = r.data.tentang;
      state.urlFoto.value = r.data.foto ?? '';
      state.urlBagan.value = r.data.gambarStrukturOrganisasi ?? '';
    });
  }
}
