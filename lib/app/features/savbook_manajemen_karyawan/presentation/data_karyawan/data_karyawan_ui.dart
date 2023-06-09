import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_karyawan_logic.dart';

class DataKaryawanUi extends StatelessWidget {
  final logic = Get.find<DataKaryawanLogic>();
  final state = Get.find<DataKaryawanLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // row title Data Karyawan
          Row(
            children: [
              Text(
                "Data Karyawan",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color(0xff00525e),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // jarak antara title dan sub title
          const SizedBox(
            height: 20,
          ),

          // tools pencarian, tombol cetak dan filter dropdown
          _tools(),

          // jarak antara tools dan tabel
          const SizedBox(
            height: 20,
          ),

          // tabel data karyawan
          _table(),
        ],
      ),
    );
  }

  Widget _tools() {
    return Row(
      children: [
        // field pencarian
        Container(
          height: 30,
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffffffff),
            border: Border.all(
              width: 1,
              color: const Color(0xffe0e0e0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // icon search
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  Icons.search,
                  color: Color(0xff00525e),
                ),
              ),
              // field search
              Expanded(
                child: TextFormField(
                  cursorColor: const Color(0xff00525e),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cari Nama Karyawan',
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 8,
                      color: const Color(0xff00525e),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // tombol upload
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff00dbb0),
          ),
          child: const Icon(
            Icons.upload_outlined,
            color: Colors.white,
          ),
        ),

        // tombol cetak kotak
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff00dbb0),
          ),
          child: const Icon(
            Icons.print,
            color: Colors.white,
          ),
        ),

        Expanded(child: Container()),
        // membuat dropdown menu filter
        const SizedBox(
          width: 10,
        ),
        Obx(() {
          return DropdownButton<String>(
            value: state.filter.value,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xff00525e),
            ),
            iconSize: 24,
            elevation: 16,
            style: GoogleFonts.montserrat(
              fontSize: 8,
              color: const Color(0xff00525e),
            ),
            underline: Container(
              height: 2,
              color: const Color(0xff00525e),
            ),
            onChanged: (String? newValue) {
              logic.changeFilter(newValue!);
            },
            items: <String>[
              'Semua',
              'Karyawan Tetap',
              'Karyawan Kontrak',
              'Karyawan Magang'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      color: const Color(0xff00525e),
                    )),
              );
            }).toList(),
          );
        }),
      ],
    );
  }

  Widget _table() {
    // return Container() dengan border radius dan thicknes
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: const Color(0xffe0e0e0),
        ),
      ),
      child: Column(
        children: [
          // row header tabel
          Row(
            children: [
              //checkbox dengan clikable
              Obx(() {
                return Checkbox(
                  value: state.selectAll.value,
                  onChanged: (bool? value) => logic.selectAll(value!),
                );
              }),

              // column header tabel
              _headerTable("No Karyawan", onTap: () {}),
              _headerTable("Nama Karyawan", onTap: () {}),
              _headerTable("Posisi Pekerjaan", onTap: () {}),
              _headerTable("Perusahaan", onTap: () {}),
              _headerTable("Lokasi", onTap: () {}),
              _headerTable("Tindakan", onTap: () {}),
            ],
          ),

          // row data tabel
          Obx(() {
            return ListView.builder(
              itemCount: state.dataKaryawan.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                children: [
                  // column data tabel
                  Obx(() {
                    return Checkbox(
                      value: state.selectAll.value,
                      onChanged: (bool? value) => logic.selectAll(value!),
                    );
                  }),
                  _dataTable(state.dataKaryawan[index].profil.noKaryawan),
                  _dataTable(state.dataKaryawan[index].profil.namaLengkap),
                  _dataTable('state.dataKaryawan[index].kontrak'),
                  _dataTable('state.dataKaryawan[index].kontrak'),
                  _dataTable('state.dataKaryawan[index].kontrak'),
                  _dataTable("Detail"),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  _headerTable(String title, {required Null Function() onTap}) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onTap(),
            child: Container(
              height: 30,
              child: Center(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    color: Color(0xff00525e),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // // icon panah bawah atas
          // InkWell(
          //   onTap: () => onTap(),
          //   child: const Icon(
          //     Icons.arrow_drop_down,
          //     color: Color(0xff00525e),
          //   ),
          // ),
        ],
      ),
    );
  }

  _dataTable(String value) {
    return Expanded(
      child: Text(
        value,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          fontSize: 8,
          color: const Color(0xff00525e),
        ),
      ),
    );
  }
}
