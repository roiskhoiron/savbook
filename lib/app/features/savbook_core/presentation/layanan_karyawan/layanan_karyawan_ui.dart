import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layanan_karyawan_logic.dart';

class LayananKaryawanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LayananKaryawanLogic>();
    final state = Get.find<LayananKaryawanLogic>().state;

    return const Center(
      child: Text('Layanan Karyawan'),
    );
  }
}
