import 'package:get/get.dart';

import 'aset_dihapus_logic.dart';

class AsetDihapusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AsetDihapusLogic());
  }
}
