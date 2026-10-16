import 'package:flutter/material.dart';
import 'package:tugas4_app/ui/biodata/biodata_pribadi.dart';
import 'package:tugas4_app/ui/biodata/biodata_pendidikan.dart';
import 'package:tugas4_app/ui/biodata/biodata_pekerjaan.dart';
import 'package:tugas4_app/ui/biodata/biodata_organisasi.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage>
    with SingleTickerProviderStateMixin {
  // TabController untuk mengelola tab navigasi
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi TabController dengan 4 tab
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: 'Pribadi'),
            Tab(icon: Icon(Icons.school), text: 'Pendidikan'),
            Tab(icon: Icon(Icons.work), text: 'Pekerjaan'),
            Tab(icon: Icon(Icons.groups), text: 'Organisasi'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BiodataPribadi(),
          BiodataPendidikan(),
          BiodataPekerjaan(),
          BiodataOrganisasi(),
        ],
      ),
    );
  }
}
