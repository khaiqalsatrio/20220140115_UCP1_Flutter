import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  const PiketPage({super.key});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Piket Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama Anggota'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan nama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: tanggalController,
                decoration: const InputDecoration(labelText: 'Pilih Tanggal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan tanggal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: tugasController,
                decoration: const InputDecoration(labelText: 'Tugas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan tugas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailPiketPage(
                              namaAnggota: namaController.text,
                              tanggal: tanggalController.text,
                              tugas: tugasController.text,
                            ),
                      ),
                    );
                  }
                },
                child: const Text('Selesai'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tambahkan ini sebagai placeholder jika belum ada:
class DetailPiketPage extends StatelessWidget {
  final String namaAnggota;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    super.key,
    required this.namaAnggota,
    required this.tanggal,
    required this.tugas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Piket')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $namaAnggota'),
            Text('Tanggal: $tanggal'),
            Text('Tugas: $tugas'),
          ],
        ),
      ),
    );
  }
}
