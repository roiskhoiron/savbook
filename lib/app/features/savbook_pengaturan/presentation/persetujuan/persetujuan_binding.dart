import 'package:get/get.dart';

import 'persetujuan_logic.dart';

class PersetujuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersetujuanLogic());
  }
}
