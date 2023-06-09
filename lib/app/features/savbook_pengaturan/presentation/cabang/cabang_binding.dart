import 'package:get/get.dart';

import 'cabang_logic.dart';

class CabangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CabangLogic());
  }
}
