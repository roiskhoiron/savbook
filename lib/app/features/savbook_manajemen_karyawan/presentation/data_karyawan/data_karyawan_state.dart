import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_manajemen_karyawan/infrastructure/models/response/data_karyawan_response.dart';

class DataKaryawanState {
  var filter = 'Semua'.obs;

  var selectAll = false.obs;

  var dataKaryawan = <DataKaryawan>[].obs;

  DataKaryawanState() {
    ///Initialize variables
  }
}
