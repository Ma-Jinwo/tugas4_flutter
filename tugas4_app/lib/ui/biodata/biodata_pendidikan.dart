import 'package:flutter/material.dart';

class BiodataPendidikan extends StatefulWidget {
  const BiodataPendidikan({Key? key}) : super(key: key);

  @override
  _BiodataPendidikanState createState() => _BiodataPendidikanState();
}

class _BiodataPendidikanState extends State<BiodataPendidikan> {
  // State: daftar riwayat pendidikan
  final List<Map<String, String>> _daftarPendidikan = [
    {
      'jenjang': 'SD',
      'namaSekolah': 'SDN 01 Jakarta',
      'tahunMasuk': '2008',
      'tahunLulus': '2014',
    },
    {
      'jenjang': 'SMP',
      'namaSekolah': 'SMPN 01 Jakarta',
      'tahunMasuk': '2014',
      'tahunLulus': '2017',
    },
    {
      'jenjang': 'SMA',
      'namaSekolah': 'SMAN 01 Jakarta',
      'tahunMasuk': '2017',
      'tahunLulus': '2020',
    },
    {
      'jenjang': 'S1',
      'namaSekolah': 'Universitas Contoh',
      'tahunMasuk': '2020',
      'tahunLulus': 'Sekarang',
    },
  ];

  // Controller untuk form tambah pendidikan
  final _jenjangController = TextEditingController();
  final _namaSekolahController = TextEditingController();
  final _tahunMasukController = TextEditingController();
  final _tahunLulusController = TextEditingController();

  @override
  void dispose() {
    _jenjangController.dispose();
    _namaSekolahController.dispose();
    _tahunMasukController.dispose();
    _tahunLulusController.dispose();
    super.dispose();
  }

  /// Menampilkan dialog untuk menambah riwayat pendidikan baru
  void _tampilDialogTambah() {
    // Reset controller
    _jenjangController.clear();
    _namaSekolahController.clear();
    _tahunMasukController.clear();
    _tahunLulusController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Pendidikan'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _jenjangController,
                decoration:
                    const InputDecoration(labelText: 'Jenjang (SD/SMP/SMA/S1)'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _namaSekolahController,
                decoration:
                    const InputDecoration(labelText: 'Nama Sekolah/Universitas'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tahunMasukController,
                decoration: const InputDecoration(labelText: 'Tahun Masuk'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tahunLulusController,
                decoration: const InputDecoration(labelText: 'Tahun Lulus'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              // Tambahkan data ke daftar dan update state
              setState(() {
                _daftarPendidikan.add({
                  'jenjang': _jenjangController.text,
                  'namaSekolah': _namaSekolahController.text,
                  'tahunMasuk': _tahunMasukController.text,
                  'tahunLulus': _tahunLulusController.text,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  /// Menghapus riwayat pendidikan pada index tertentu
  void _hapusPendidikan(int index) {
    setState(() {
      _daftarPendidikan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _daftarPendidikan.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data pendidikan.\nTekan tombol + untuk menambahkan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarPendidikan.length,
              itemBuilder: (context, index) {
                final item = _daftarPendidikan[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        item['jenjang'] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      item['namaSekolah'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '${item['tahunMasuk']} - ${item['tahunLulus']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _hapusPendidikan(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tampilDialogTambah,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
