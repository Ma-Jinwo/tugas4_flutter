import 'package:flutter/material.dart';

class BiodataPekerjaan extends StatefulWidget {
  const BiodataPekerjaan({Key? key}) : super(key: key);

  @override
  _BiodataPekerjaanState createState() => _BiodataPekerjaanState();
}

class _BiodataPekerjaanState extends State<BiodataPekerjaan> {
  // State: daftar riwayat pekerjaan
  final List<Map<String, String>> _daftarPekerjaan = [
    {
      'posisi': 'Web Developer Intern',
      'perusahaan': 'PT Teknologi Nusantara',
      'tahunMulai': '2023',
      'tahunSelesai': '2023',
      'deskripsi': 'Mengembangkan aplikasi web menggunakan React.js',
    },
    {
      'posisi': 'Mobile Developer Freelance',
      'perusahaan': 'Freelance',
      'tahunMulai': '2024',
      'tahunSelesai': 'Sekarang',
      'deskripsi': 'Membuat aplikasi mobile menggunakan Flutter',
    },
  ];

  // Controller untuk form tambah pekerjaan
  final _posisiController = TextEditingController();
  final _perusahaanController = TextEditingController();
  final _tahunMulaiController = TextEditingController();
  final _tahunSelesaiController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _posisiController.dispose();
    _perusahaanController.dispose();
    _tahunMulaiController.dispose();
    _tahunSelesaiController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  /// Menampilkan dialog untuk menambah riwayat pekerjaan baru
  void _tampilDialogTambah() {
    _posisiController.clear();
    _perusahaanController.clear();
    _tahunMulaiController.clear();
    _tahunSelesaiController.clear();
    _deskripsiController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Pekerjaan'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _posisiController,
                decoration: const InputDecoration(labelText: 'Posisi/Jabatan'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _perusahaanController,
                decoration:
                    const InputDecoration(labelText: 'Nama Perusahaan'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tahunMulaiController,
                decoration: const InputDecoration(labelText: 'Tahun Mulai'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tahunSelesaiController,
                decoration: const InputDecoration(labelText: 'Tahun Selesai'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                maxLines: 3,
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
                _daftarPekerjaan.add({
                  'posisi': _posisiController.text,
                  'perusahaan': _perusahaanController.text,
                  'tahunMulai': _tahunMulaiController.text,
                  'tahunSelesai': _tahunSelesaiController.text,
                  'deskripsi': _deskripsiController.text,
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

  /// Menghapus riwayat pekerjaan pada index tertentu
  void _hapusPekerjaan(int index) {
    setState(() {
      _daftarPekerjaan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _daftarPekerjaan.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data pekerjaan.\nTekan tombol + untuk menambahkan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarPekerjaan.length,
              itemBuilder: (context, index) {
                final item = _daftarPekerjaan[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['posisi'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusPekerjaan(index),
                            ),
                          ],
                        ),
                        Text(
                          item['perusahaan'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['tahunMulai']} - ${item['tahunSelesai']}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['deskripsi'] ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
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
