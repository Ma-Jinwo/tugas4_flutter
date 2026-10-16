import 'package:flutter/material.dart';

/// Halaman form untuk menambah nilai mata kuliah baru
/// Data yang diinput akan dikembalikan ke NilaiPage melalui Navigator.pop()
class NilaiForm extends StatefulWidget {
  const NilaiForm({Key? key}) : super(key: key);

  @override
  _NilaiFormState createState() => _NilaiFormState();
}

class _NilaiFormState extends State<NilaiForm> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap field input
  final _kodeMatkulController = TextEditingController();
  final _namaMatkulController = TextEditingController();
  final _sksController = TextEditingController();
  final _nilaiController = TextEditingController();

  @override
  void dispose() {
    _kodeMatkulController.dispose();
    _namaMatkulController.dispose();
    _sksController.dispose();
    _nilaiController.dispose();
    super.dispose();
  }

  /// Fungsi untuk menyimpan data dan mengembalikan ke halaman sebelumnya
  void _simpan() {
    if (_formKey.currentState!.validate()) {
      // Membuat map data untuk dikembalikan
      final data = {
        'kodeMatkul': _kodeMatkulController.text,
        'namaMatkul': _namaMatkulController.text,
        'sks': int.parse(_sksController.text),
        'nilai': int.parse(_nilaiController.text),
      };
      // Kembalikan data ke halaman NilaiPage
      Navigator.pop(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Nilai'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Field Kode Mata Kuliah
              TextFormField(
                controller: _kodeMatkulController,
                decoration: const InputDecoration(
                  labelText: 'Kode Mata Kuliah',
                  hintText: 'Contoh: IF101',
                  prefixIcon: Icon(Icons.code),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode mata kuliah harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Field Nama Mata Kuliah
              TextFormField(
                controller: _namaMatkulController,
                decoration: const InputDecoration(
                  labelText: 'Nama Mata Kuliah',
                  hintText: 'Contoh: Pemrograman Mobile',
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama mata kuliah harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Field SKS
              TextFormField(
                controller: _sksController,
                decoration: const InputDecoration(
                  labelText: 'SKS',
                  hintText: 'Contoh: 3',
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'SKS harus diisi';
                  }
                  final sks = int.tryParse(value);
                  if (sks == null || sks < 1 || sks > 6) {
                    return 'SKS harus berupa angka antara 1-6';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Field Nilai
              TextFormField(
                controller: _nilaiController,
                decoration: const InputDecoration(
                  labelText: 'Nilai',
                  hintText: 'Contoh: 85',
                  prefixIcon: Icon(Icons.grade),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nilai harus diisi';
                  }
                  final nilai = int.tryParse(value);
                  if (nilai == null || nilai < 0 || nilai > 100) {
                    return 'Nilai harus berupa angka antara 0-100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Tombol Simpan
              ElevatedButton.icon(
                onPressed: _simpan,
                icon: const Icon(Icons.save),
                label: const Text('Simpan Nilai'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
