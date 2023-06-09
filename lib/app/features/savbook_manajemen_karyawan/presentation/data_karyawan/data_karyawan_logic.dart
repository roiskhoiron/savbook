import 'package:get/get.dart';

import '../../application/data_karyawan_app_service.dart';
import '../../domain/interfaces/i_data_karyawan_app_service.dart';
import 'data_karyawan_state.dart';

class DataKaryawanLogic extends GetxController {
  final DataKaryawanState state = DataKaryawanState();
  final IDataKaryawanAppService _app = Get.find<DataKaryawanAppService>();

  @override
  void onInit() {
    _showDataKaryawan();
    super.onInit();
  }

  void _showDataKaryawan() async {
    final res = await _app.getDataKaryawan();

    res.fold((l) {
      // handle error
    }, (r) {
      state.dataKaryawan.value = r;
    });
  }

  void changeFilter(String filter) => state.filter.value = filter;

  void selectAll(bool bool) => state.selectAll.value = bool;
}
