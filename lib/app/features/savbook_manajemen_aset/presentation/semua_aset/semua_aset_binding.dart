import 'package:get/get.dart';

import 'semua_aset_logic.dart';

class SemuaAsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SemuaAsetLogic());
  }
}
