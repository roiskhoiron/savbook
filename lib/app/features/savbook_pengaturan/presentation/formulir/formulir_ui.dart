import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'formulir_logic.dart';

class FormulirUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FormulirLogic>();
    final state = Get.find<FormulirLogic>().state;

    return const Center(
      child: Text('Formulir'),
    );
  }
}
