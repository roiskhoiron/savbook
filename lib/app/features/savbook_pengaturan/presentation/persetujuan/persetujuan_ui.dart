import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'persetujuan_logic.dart';

class PersetujuanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PersetujuanLogic>();
    final state = Get.find<PersetujuanLogic>().state;

    return const Center(
      child: Text('Persetujuan'),
    );
  }
}
