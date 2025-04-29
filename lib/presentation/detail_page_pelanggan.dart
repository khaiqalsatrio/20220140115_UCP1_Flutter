import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/home_page.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodepos;

  const DetailPelangganPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pelanggan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Anggota: $nama'),
            Text('email: $email'),
            Text('alamat: $alamat'),
            Text('provinsi: $provinsi'),
            Text('kode pos: $kodepos'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
