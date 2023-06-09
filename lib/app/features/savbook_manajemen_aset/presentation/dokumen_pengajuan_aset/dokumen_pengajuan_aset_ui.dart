import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dokumen_pengajuan_aset_logic.dart';

class DokumenPengajuanAsetUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DokumenPengajuanAsetLogic>();
    final state = Get.find<DokumenPengajuanAsetLogic>().state;

    return const Center(
      child: Text('Dokumen Pengajuan Aset'),
    );
  }
}
