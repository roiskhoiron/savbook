import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savbook/utility/shared/constants/colors.dart';

import 'profil_perusahaan_logic.dart';

class ProfilPerusahaanUi extends StatelessWidget {
  final logic = Get.find<ProfilPerusahaanLogic>();
  final state = Get.find<ProfilPerusahaanLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //title Profil Perusahaan
          Row(
            children: [
              Text(
                'Profil Perusahaan',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Color(0xff00525e),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // jarak antara title dan konten
          const SizedBox(
            height: 20,
          ),

          // tampilan dengan tiga baris menggunakan row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // baris pertama visi dan misi secara vertikal
              Expanded(child: _visiMisi()),

              // jarak antara visi misi dan gambar
              const SizedBox(
                width: 20,
              ),
              // baris kedua gambar
              Expanded(child: _gambar()),

              // jarak antara gambar dan tentang perusahaan
              const SizedBox(
                width: 20,
              ),
              // baris ketiga tentang perusahaan
              Expanded(child: _tentangPerusahaan()),
            ],
          ),

          // title Struktur Organisasi
          Row(
            children: [
              Text(
                'Struktur Organisasi',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // gambar struktur organisasi
          Image.asset(
            'images/chart_org.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _visiMisi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // visi
        Container(
          child: Text('Visi',
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        // isi visi
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(state.visi.value,
              style: GoogleFonts.montserrat(
                  fontSize: 10, color: hexToColor('#00525E'))),
        ),

        // jarak antara visi dan misi
        const SizedBox(
          height: 20,
        ),

        // misi
        Container(
          child: Text('Misi',
              style: GoogleFonts.montserrat(
                  fontSize: 10, fontWeight: FontWeight.bold)),
        ),
        // isi misi
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(state.misi.value,
              style: GoogleFonts.montserrat(
                  fontSize: 12, color: hexToColor('#00525E'))),
        ),
      ],
    );
  }

  Widget _gambar() {
    return Container(
      child: Image.asset(
        'images/gedung.jpeg',
        width: 200,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _tentangPerusahaan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // tentang perusahaan
        Container(
          child: Text('Tentang Kami',
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        // isi tentang perusahaan
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(state.tentang.value,
              style: GoogleFonts.montserrat(
                  fontSize: 10, color: hexToColor('#00525E'))),
        ),
      ],
    );
  }
}
