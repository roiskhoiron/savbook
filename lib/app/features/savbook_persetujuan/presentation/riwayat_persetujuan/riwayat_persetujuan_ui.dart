import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'riwayat_persetujuan_logic.dart';

class RiwayatPersetujuanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RiwayatPersetujuanLogic>();
    final state = Get.find<RiwayatPersetujuanLogic>().state;

    return const Center(
      child: Text('Riwayat Persetujuan'),
    );
  }
}
