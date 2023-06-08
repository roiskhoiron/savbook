import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_karyawan_resign_logic.dart';

class DataKaryawanResignUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DataKaryawanResignLogic>();
    final state = Get.find<DataKaryawanResignLogic>().state;

    return const Center(
      child: Text('Data Karyawan Resign'),
    );
  }
}
