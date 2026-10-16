import 'package:flutter/material.dart';
import 'package:tugas4_app/ui/nilai/nilai_form.dart';
import 'package:tugas4_app/ui/nilai/nilai_detail.dart';

class NilaiPage extends StatefulWidget {
  const NilaiPage({Key? key}) : super(key: key);

  @override
  _NilaiPageState createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  // State: daftar nilai mahasiswa
  final List<Map<String, dynamic>> _daftarNilai = [
    {
      'kodeMatkul': 'IF101',
      'namaMatkul': 'Algoritma dan Pemrograman',
      'sks': 3,
      'nilai': 85,
      'grade': 'A',
    },
    {
      'kodeMatkul': 'IF102',
      'namaMatkul': 'Struktur Data',
      'sks': 3,
      'nilai': 78,
      'grade': 'B+',
    },
    {
      'kodeMatkul': 'IF103',
      'namaMatkul': 'Basis Data',
      'sks': 3,
      'nilai': 90,
      'grade': 'A',
    },
    {
      'kodeMatkul': 'IF104',
      'namaMatkul': 'Pemrograman Web',
      'sks': 3,
      'nilai': 82,
      'grade': 'A-',
    },
    {
      'kodeMatkul': 'IF105',
      'namaMatkul': 'Pemrograman Mobile',
      'sks': 3,
      'nilai': 88,
      'grade': 'A',
    },
  ];

  /// Fungsi untuk menghitung grade berdasarkan nilai angka
  String _hitungGrade(int nilai) {
    if (nilai >= 85) return 'A';
    if (nilai >= 80) return 'A-';
    if (nilai >= 75) return 'B+';
    if (nilai >= 70) return 'B';
    if (nilai >= 65) return 'B-';
    if (nilai >= 60) return 'C+';
    if (nilai >= 55) return 'C';
    if (nilai >= 50) return 'D';
    return 'E';
  }

  /// Fungsi untuk menambah nilai baru dari NilaiForm
  /// Dipanggil setelah kembali dari halaman NilaiForm
  void _tambahNilai() async {
    // Navigasi ke halaman NilaiForm dan tunggu hasilnya
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NilaiForm()),
    );

    // Jika mendapatkan data dari NilaiForm, tambahkan ke daftar
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        int nilai = result['nilai'];
        result['grade'] = _hitungGrade(nilai);
        _daftarNilai.add(result);
      });
    }
  }

  /// Menghapus nilai pada index tertentu
  void _hapusNilai(int index) {
    setState(() {
      _daftarNilai.removeAt(index);
    });
  }

  /// Mendapatkan warna berdasarkan grade
  Color _warnaGrade(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'A-':
        return Colors.green.shade300;
      case 'B+':
        return Colors.blue;
      case 'B':
        return Colors.blue.shade300;
      case 'B-':
        return Colors.orange;
      case 'C+':
        return Colors.orange.shade300;
      case 'C':
        return Colors.deepOrange;
      case 'D':
        return Colors.red.shade300;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nilai Mahasiswa'),
        actions: [
          // Tombol + untuk menambah nilai (seperti contoh di praktikum)
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add),
            ),
            onTap: () => _tambahNilai(),
          ),
        ],
      ),
      body: _daftarNilai.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data nilai.\nTekan tombol + untuk menambahkan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _daftarNilai.length,
              itemBuilder: (context, index) {
                final item = _daftarNilai[index];
                return ItemNilai(
                  kodeMatkul: item['kodeMatkul'],
                  namaMatkul: item['namaMatkul'],
                  sks: item['sks'],
                  nilai: item['nilai'],
                  grade: item['grade'],
                  warnaGrade: _warnaGrade(item['grade']),
                  onTap: () {
                    // Navigasi ke halaman Detail Nilai saat diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NilaiDetail(
                          kodeMatkul: item['kodeMatkul'],
                          namaMatkul: item['namaMatkul'],
                          sks: item['sks'],
                          nilai: item['nilai'],
                          grade: item['grade'],
                        ),
                      ),
                    );
                  },
                  onDelete: () => _hapusNilai(index),
                );
              },
            ),
    );
  }
}

/// Widget StatelessWidget yang dipisahkan untuk menampilkan item nilai
/// (Sesuai praktikum: pemisahan widget ke dalam class StatelessWidget)
class ItemNilai extends StatelessWidget {
  final String? kodeMatkul;
  final String? namaMatkul;
  final int? sks;
  final int? nilai;
  final String? grade;
  final Color warnaGrade;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const ItemNilai({
    Key? key,
    this.kodeMatkul,
    this.namaMatkul,
    this.sks,
    this.nilai,
    this.grade,
    this.warnaGrade = Colors.green,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Badge grade
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: warnaGrade.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    grade ?? '-',
                    style: TextStyle(
                      color: warnaGrade,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Info matkul
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaMatkul ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${kodeMatkul ?? ''} • $sks SKS • Nilai: $nilai',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // Tombol hapus
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
