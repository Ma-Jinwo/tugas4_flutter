import 'package:flutter/material.dart';

/// Halaman detail untuk menampilkan informasi lengkap suatu mata kuliah
/// Menerima data nilai melalui constructor
class NilaiDetail extends StatelessWidget {
  final String? kodeMatkul;
  final String? namaMatkul;
  final int? sks;
  final int? nilai;
  final String? grade;

  const NilaiDetail({
    Key? key,
    this.kodeMatkul,
    this.namaMatkul,
    this.sks,
    this.nilai,
    this.grade,
  }) : super(key: key);

  /// Mendapatkan warna berdasarkan grade
  Color _warnaGrade(String? grade) {
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

  /// Mendapatkan deskripsi grade
  String _deskripsiGrade(String? grade) {
    switch (grade) {
      case 'A':
        return 'Sangat Baik';
      case 'A-':
        return 'Hampir Sangat Baik';
      case 'B+':
        return 'Lebih dari Baik';
      case 'B':
        return 'Baik';
      case 'B-':
        return 'Hampir Baik';
      case 'C+':
        return 'Lebih dari Cukup';
      case 'C':
        return 'Cukup';
      case 'D':
        return 'Kurang';
      default:
        return 'Sangat Kurang';
    }
  }

  @override
  Widget build(BuildContext context) {
    final warna = _warnaGrade(grade);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Nilai'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Badge grade besar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: warna.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: warna, width: 2),
              ),
              child: Center(
                child: Text(
                  grade ?? '-',
                  style: TextStyle(
                    color: warna,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _deskripsiGrade(grade),
              style: TextStyle(
                color: warna,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            // Detail card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Mata Kuliah',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const Divider(),
                    _buildDetailRow('Kode Matkul', kodeMatkul ?? '-'),
                    _buildDetailRow('Nama Matkul', namaMatkul ?? '-'),
                    _buildDetailRow('SKS', '${sks ?? '-'}'),
                    _buildDetailRow('Nilai Angka', '${nilai ?? '-'}'),
                    _buildDetailRow('Grade', grade ?? '-'),
                    _buildDetailRow('Keterangan', _deskripsiGrade(grade)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget helper untuk menampilkan baris detail
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
