import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savbook/utility/shared/constants/colors.dart';

import 'dashboard_logic.dart';

class DashboardUi extends StatelessWidget {
  static const String routeName = '/dashboard';

  final logic = Get.find<DashboardLogic>();
  final state = Get.find<DashboardLogic>().state;

  DashboardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          flex: 2,
          child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              }, scrollbars: false),
              child: SidebarMenu()),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              _header(),
              Obx(() {
                return Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: logic.showPageOfMenu(menu: state.onTapMenu.value),
                ));
              }),
            ],
          ),
        ),
      ],
    ));
  }

  _header() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // icon notifikasi dengan indicator merah jika ada notifikasi dengan badges widget
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications_none_outlined,
                      color: Colors.grey),
                  onPressed: () {},
                ),
                // badges bulat merah
                Positioned(
                  top: 13,
                  right: 12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipOval(
                      child: Container(
                          width: 8,
                          height: 8,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              '1',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 4,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),

            // circle avatar
            CircleAvatar(
              radius: 16,
              backgroundColor: hexToColor('#f2f9f7'),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage('images/avatar.jpeg'),
              ),
            ),

            // icon dropdown yang membuka list menu ListTile
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(thickness: 1),
      ],
    );
  }
}

class SidebarMenu extends StatelessWidget {
  SidebarMenu({super.key});

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.2,
      backgroundColor: hexToColor('#f2f9f7'),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(child: Image.asset('assets/images/logo.png')),
            ),
            Text("MANAJEMEN KARYAWAN",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            SidebarGroup(
              groupName: 'HR Sistem Informasi',
              groupItems: const [
                'Data Karyawan',
                'Dokumen Pengajuan',
                'Data Karyawan Resign',
                'Data Karyawan Dihapus'
              ],
            ),
            ListTile(
              leading: Icon(Icons.corporate_fare_outlined,
                  color: hexToColor('#858585')),
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.only(left: 0),
              title: Text(
                'Profil Perushaan',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Profil Perushaan'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Layanan Karyawan',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Layanan Karyawan'),
            ),
            Text("MANAJEMEN ASET",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            SidebarGroup(
              groupName: 'Aset',
              groupItems: const [
                'Semua Aset',
                'Dokumen Pengajuan Aset',
                'Aset Rusak',
                'Aset Dihapus',
              ],
            ),
            Text("PERSETUJUAN",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            ListTile(
              leading: Icon(
                Icons.task_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Daftar Persetujuan',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Daftar Persetujuan'),
            ),
            ListTile(
              leading: Icon(
                Icons.restore_page_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Riwayat Persetujuan',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Riwayat Persetujuan'),
            ),
            Text("PENGATURAN",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            ListTile(
              leading: Icon(
                Icons.corporate_fare_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Cabang',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Cabang'),
            ),
            ListTile(
              leading: Icon(
                Icons.emoji_people_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Hak Akses Pengguna',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Hak Akses Pengguna'),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Pengguna',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Pengguna'),
            ),
            ListTile(
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Persetujuan',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Persetujuan'),
            ),
            ListTile(
              leading: Icon(
                Icons.insert_page_break_outlined,
                color: hexToColor('#858585'),
              ),
              contentPadding: const EdgeInsets.only(left: 0),
              minLeadingWidth: 0,
              title: Text(
                'Formulir',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () => logic.onTapMenu(title: 'Formulir'),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarGroup extends StatelessWidget {
  final String groupName;
  final List<String> groupItems;
  final logic = Get.find<DashboardLogic>();

  SidebarGroup({
    Key? key,
    required this.groupName,
    required this.groupItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.all(0.0),
      tilePadding: const EdgeInsets.all(0.0),
      leading: Icon(
        Icons.people_alt_outlined,
        color: hexToColor('#858585'),
      ),
      initiallyExpanded: true,
      title: Text(
        groupName,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: Color(0xff858585),
            fontSize: 8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      children: groupItems.map((item) {
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 46.0),
          minVerticalPadding: 0,
          title: Text(
            item,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Color(0xff858585),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          onTap: () => logic.onTapMenu(title: item),
        );
      }).toList(),
    );
  }
}
