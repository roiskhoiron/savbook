import 'package:get/get.dart';

import 'riwayat_persetujuan_logic.dart';

class RiwayatPersetujuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RiwayatPersetujuanLogic());
  }
}
