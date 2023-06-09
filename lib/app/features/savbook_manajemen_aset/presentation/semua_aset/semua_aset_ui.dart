import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'semua_aset_logic.dart';

class SemuaAsetUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SemuaAsetLogic>();
    final state = Get.find<SemuaAsetLogic>().state;

    return const Center(
      child: Text('Semua Aset'),
    );
  }
}
