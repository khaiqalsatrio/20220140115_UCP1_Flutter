import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/home_page.dart';

class DetailPiketPage extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.tugas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Piket Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Anggota: $nama'),
            Text('Tanggal: $tanggal'),
            Text('Tugas: $tugas'),
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
