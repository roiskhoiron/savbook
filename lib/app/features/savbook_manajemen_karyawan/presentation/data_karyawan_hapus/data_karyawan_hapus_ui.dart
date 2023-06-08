import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_karyawan_hapus_logic.dart';

class DataKaryawanHapusUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DataKaryawanHapusLogic>();
    final state = Get.find<DataKaryawanHapusLogic>().state;

    return const Center(
      child: Text('Data Karyawan DiHapus'),
    );
  }
}
