import 'package:flutter/material.dart';

class BiodataPribadi extends StatefulWidget {
  const BiodataPribadi({Key? key}) : super(key: key);

  @override
  _BiodataPribadiState createState() => _BiodataPribadiState();
}

class _BiodataPribadiState extends State<BiodataPribadi> {
  // State untuk menyimpan apakah sedang mode edit atau tidak
  bool _isEditing = false;

  // Controller untuk setiap field input
  final _namaController = TextEditingController(text: 'Mathew');
  final _nimController = TextEditingController(text: '2024001');
  final _tempatLahirController = TextEditingController(text: 'Jakarta');
  final _tanggalLahirController = TextEditingController(text: '01-01-2002');
  final _alamatController =
      TextEditingController(text: 'Jl. Merdeka No. 10, Jakarta');
  final _teleponController = TextEditingController(text: '081234567890');
  final _emailController =
      TextEditingController(text: 'mathew@student.univ.ac.id');
  final _jenisKelaminController = TextEditingController(text: 'Laki-Laki');

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tempatLahirController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    _teleponController.dispose();
    _emailController.dispose();
    _jenisKelaminController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Avatar dan nama
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          // Tombol edit/simpan
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            label: Text(_isEditing ? 'Simpan' : 'Edit Biodata'),
          ),
          const SizedBox(height: 20),
          // Card berisi data pribadi
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Pribadi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const Divider(),
                  _buildField('Nama Lengkap', _namaController),
                  _buildField('NIM', _nimController),
                  _buildField('Jenis Kelamin', _jenisKelaminController),
                  _buildField('Tempat Lahir', _tempatLahirController),
                  _buildField('Tanggal Lahir', _tanggalLahirController),
                  _buildField('Alamat', _alamatController),
                  _buildField('No. Telepon', _teleponController),
                  _buildField('Email', _emailController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk menampilkan field data
  /// Jika _isEditing true, tampilkan TextField (bisa diedit)
  /// Jika _isEditing false, tampilkan teks biasa (read-only)
  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: _isEditing
          ? TextField(
              controller: controller,
              decoration: InputDecoration(labelText: label),
            )
          : Row(
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
                    controller.text,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
    );
  }
}
