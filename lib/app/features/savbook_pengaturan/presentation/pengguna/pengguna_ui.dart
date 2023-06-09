import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pengguna_logic.dart';

class PenggunaUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PenggunaLogic>();
    final state = Get.find<PenggunaLogic>().state;

    return const Center(
      child: Text('Pengguna'),
    );
  }
}
