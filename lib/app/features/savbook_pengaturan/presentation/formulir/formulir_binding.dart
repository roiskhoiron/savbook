import 'package:get/get.dart';

import 'formulir_logic.dart';

class FormulirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormulirLogic());
  }
}
