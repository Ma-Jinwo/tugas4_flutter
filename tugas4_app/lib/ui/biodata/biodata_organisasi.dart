import 'package:flutter/material.dart';

class BiodataOrganisasi extends StatefulWidget {
  const BiodataOrganisasi({Key? key}) : super(key: key);

  @override
  _BiodataOrganisasiState createState() => _BiodataOrganisasiState();
}

class _BiodataOrganisasiState extends State<BiodataOrganisasi> {
  // State: daftar riwayat organisasi
  final List<Map<String, String>> _daftarOrganisasi = [
    {
      'nama': 'Himpunan Mahasiswa Informatika',
      'jabatan': 'Anggota Divisi Humas',
      'tahun': '2021 - 2022',
    },
    {
      'nama': 'UKM Programming Club',
      'jabatan': 'Ketua',
      'tahun': '2022 - 2023',
    },
    {
      'nama': 'BEM Fakultas Teknik',
      'jabatan': 'Staff Departemen Pendidikan',
      'tahun': '2023 - 2024',
    },
  ];

  // Controller untuk form tambah organisasi
  final _namaController = TextEditingController();
  final _jabatanController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _jabatanController.dispose();
    _tahunController.dispose();
    super.dispose();
  }

  /// Menampilkan dialog untuk menambah organisasi baru
  void _tampilDialogTambah() {
    _namaController.clear();
    _jabatanController.clear();
    _tahunController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Organisasi'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration:
                    const InputDecoration(labelText: 'Nama Organisasi'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _jabatanController,
                decoration: const InputDecoration(labelText: 'Jabatan'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tahunController,
                decoration:
                    const InputDecoration(labelText: 'Periode (cth: 2023-2024)'),
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
              setState(() {
                _daftarOrganisasi.add({
                  'nama': _namaController.text,
                  'jabatan': _jabatanController.text,
                  'tahun': _tahunController.text,
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

  /// Menghapus organisasi pada index tertentu
  void _hapusOrganisasi(int index) {
    setState(() {
      _daftarOrganisasi.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _daftarOrganisasi.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data organisasi.\nTekan tombol + untuk menambahkan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarOrganisasi.length,
              itemBuilder: (context, index) {
                final item = _daftarOrganisasi[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.groups, color: Colors.white),
                    ),
                    title: Text(
                      item['nama'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['jabatan'] ?? ''),
                        Text(
                          item['tahun'] ?? '',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _hapusOrganisasi(index),
                    ),
                    isThreeLine: true,
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
