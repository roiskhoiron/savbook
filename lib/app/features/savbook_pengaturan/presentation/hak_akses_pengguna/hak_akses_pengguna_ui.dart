import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hak_akses_pengguna_logic.dart';

class HakAksesPenggunaUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HakAksesPenggunaLogic>();
    final state = Get.find<HakAksesPenggunaLogic>().state;

    return const Center(
      child: Text('Hak Akses Pengguna'),
    );
  }
}
