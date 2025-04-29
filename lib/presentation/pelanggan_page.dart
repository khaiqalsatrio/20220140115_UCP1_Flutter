import 'package:flutter/material.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pelanggan Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama guest'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan nama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: noHpController,
                decoration: const InputDecoration(labelText: 'No Hp'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan No Hp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan Alamat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: provinsiController,
                decoration: const InputDecoration(labelText: 'Provinsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan provinsi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: kodePosController,
                decoration: const InputDecoration(labelText: 'Kode Pos'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan Kode Pos';
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
                            (context) => DetailPelangganPage(
                              namaAnggota: namaController.text,
                              email: emailController.text,
                              noHp: noHpController.text,
                              alamat: alamatController.text,
                              provinsi: provinsiController.text,
                              kodePos: kodePosController.text,
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

class DetailPelangganPage extends StatelessWidget {
  final String namaAnggota;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    super.key,
    required this.namaAnggota,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pelanggan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $namaAnggota'),
            Text('Email: $email'),
            Text('No HP: $noHp'),
            Text('Alamat: $alamat'),
            Text('Provinsi: $provinsi'),
            Text('Kode Pos: $kodePos'),
          ],
        ),
      ),
    );
  }
}
