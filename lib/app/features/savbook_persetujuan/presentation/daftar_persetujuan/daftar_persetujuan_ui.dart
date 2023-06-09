import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daftar_persetujuan_logic.dart';

class DaftarPersetujuanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DaftarPersetujuanLogic>();
    final state = Get.find<DaftarPersetujuanLogic>().state;

    return const Center(
      child: Text('Daftar Persetujuan'),
    );
  }
}
