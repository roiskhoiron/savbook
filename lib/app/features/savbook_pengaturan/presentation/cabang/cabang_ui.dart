import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cabang_logic.dart';

class CabangUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CabangLogic>();
    final state = Get.find<CabangLogic>().state;

    return const Center(
      child: Text('Cabang'),
    );
  }
}
