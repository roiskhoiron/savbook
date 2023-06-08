import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_karyawan_logic.dart';

class DataKaryawanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DataKaryawanLogic>();
    final state = Get.find<DataKaryawanLogic>().state;

    return const Center(
      child: Text('Data Karyawan'),
    );
  }
}
