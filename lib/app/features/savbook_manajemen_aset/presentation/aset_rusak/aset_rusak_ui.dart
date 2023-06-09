import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aset_rusak_logic.dart';

class AsetRusakUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AsetRusakLogic>();
    final state = Get.find<AsetRusakLogic>().state;

    return const Center(
      child: Text('Aset Rusak'),
    );
  }
}
