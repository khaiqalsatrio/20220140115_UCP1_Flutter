import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/home_page.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String HargaSatuan;
  final String totalHarga;

  const DetailBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.HargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Barang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal: $tanggal'),
            Text('jenis Transaksi: $jenisTransaksi'),
            Text('jenis Barang: $jenisBarang'),
            Text('jumlah Barang: $jumlahBarang'),
            Text('Total Harga: $totalHarga'),
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
