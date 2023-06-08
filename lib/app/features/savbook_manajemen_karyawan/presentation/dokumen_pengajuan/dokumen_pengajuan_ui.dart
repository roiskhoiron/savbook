import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dokumen_pengajuan_logic.dart';

class DokumenPengajuanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DokumenPengajuanLogic>();
    final state = Get.find<DokumenPengajuanLogic>().state;

    return const Center(
      child: Text('Dokumen Pengajuan'),
    );
  }
}
