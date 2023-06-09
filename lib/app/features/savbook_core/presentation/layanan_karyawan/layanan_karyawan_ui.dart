import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savbook/utility/shared/constants/colors.dart';

import 'layanan_karyawan_logic.dart';

class LayananKaryawanUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LayananKaryawanLogic>();
    final state = Get.find<LayananKaryawanLogic>().state;

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Layanan Karyawan",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color(0xff00525e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // jarak antara title dan konten
        const SizedBox(
          height: 20,
        ),

        // sub title 1 Saya ingin mengajukan
        Row(
          children: [
            Text(
              "Saya Ingin Mengajukan",
              style: GoogleFonts.montserrat(
                fontSize: 9,
                color: const Color(0xff00525e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // jarak antara sub title 1 dan konten
        const SizedBox(
          height: 20,
        ),

        // tampilan dengan tiga baris menggunakan row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // baris pertama ajukan cuti
            _pengajuanKaryawan(
                title: "Cuti",
                icon: Icons.calendar_today_outlined,
                onTap: () {}),

            // baris kedua ajukan sakit
            _pengajuanKaryawan(
                title: "Sakit",
                icon: Icons.local_hospital_outlined,
                onTap: () {}),

            // baris ketiga ajukan ijin
            _pengajuanKaryawan(
                title: "Izin", icon: Icons.assignment_outlined, onTap: () {}),

            // baris keempat ajukan resign
            _pengajuanKaryawan(
                title: "Pengunduran Diri",
                icon: Icons.assignment_return_outlined,
                onTap: () {}),
          ],
        ),

        // jarak antara sub title 1 dan konten
        const SizedBox(
          height: 50,
        ),

        // sub title 1 Kelola Data Pribadimu
        Row(
          children: [
            Text(
              "Kelola Data Pribadimu",
              style: GoogleFonts.montserrat(
                fontSize: 9,
                color: const Color(0xff00525e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // jarak antara sub title 2 dan konten
        const SizedBox(
          height: 20,
        ),

        // tampilan dengan tiga baris menggunakan listview grid 3 kolom
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: [
            // baris pertama Slip Gaji
            _kelolaDataPribadi(
                title: "Slip Gaji", icon: Icons.person_outline, onTap: () {}),

            // baris kedua Kehadiran
            _kelolaDataPribadi(
                title: "Kehadiran",
                icon: Icons.family_restroom_outlined,
                onTap: () {}),

            // baris ketiga Data Aset
            _kelolaDataPribadi(
                title: "Data Aset", icon: Icons.school_outlined, onTap: () {}),

            // baris keempat Cuti Saya
            _kelolaDataPribadi(
                title: "Cuti Saya",
                icon: Icons.work_outline_outlined,
                onTap: () {}),

            // baris kelima Data Sakit
            _kelolaDataPribadi(
                title: "Data Sakit", icon: Icons.badge_outlined, onTap: () {}),

            // baris keenam Data Izin
            _kelolaDataPribadi(
                title: "Data Izin",
                icon: Icons.emoji_events_outlined,
                onTap: () {}),
          ],
        ),
      ],
    ));
  }

  Widget _pengajuanKaryawan(
      {required String title,
      required IconData icon,
      required Null Function() onTap}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  hexToColor("#00dbb0"),
                  hexToColor("#00af8a"),
                ],
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 9,
              color: const Color(0xff00525e),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _kelolaDataPribadi(
      {required String title,
      required IconData icon,
      required Null Function() onTap}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: hexToColor("#f2f9f7"),
          ),
          child: Icon(
            icon,
            color: const Color(0xff00525e),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 9,
            color: const Color(0xff00525e),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
