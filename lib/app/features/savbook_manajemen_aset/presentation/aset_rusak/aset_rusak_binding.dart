import 'package:get/get.dart';

import 'aset_rusak_logic.dart';

class AsetRusakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AsetRusakLogic());
  }
}
