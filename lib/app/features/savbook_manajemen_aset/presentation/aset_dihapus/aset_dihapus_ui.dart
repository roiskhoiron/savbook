import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aset_dihapus_logic.dart';

class AsetDihapusUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AsetDihapusLogic>();
    final state = Get.find<AsetDihapusLogic>().state;

    return const Center(
      child: Text('Aset Dihapus'),
    );
  }
}
