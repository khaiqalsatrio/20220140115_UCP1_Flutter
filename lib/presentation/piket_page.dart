import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/detail_piket_page.dart';

class PiketPage extends StatefulWidget {
  const PiketPage({super.key});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  List<Map<String, String>> piketList = [];

  DateTime selectedDate = DateTime.now(); // ✅ Ditambahkan deklarasi tanggal

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tanggalController.text =
            '${picked.day}/${picked.month}/${picked.year}'; // ✅ Otomatis isi tanggal
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tanggalController.text =
        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'; // ✅ Set awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Piket'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 162, 194),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Anggota',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Anggota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pilih Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      tanggalController.text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tugas Piket',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: tugasController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Tugas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (tugasController.text.isNotEmpty &&
                        namaController.text.isNotEmpty) {
                      setState(() {
                        piketList.add({
                          'tugas': tugasController.text,
                          'tanggal': tanggalController.text,
                          'nama': namaController.text,
                        });
                      });
                      tugasController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Nama dan tugas tidak boleh kosong!"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Daftar Tugas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            piketList.isNotEmpty
                ? Column(
                  children:
                      piketList.map((piket) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(piket['tugas'] ?? ''),
                            subtitle: Text(
                              '${piket['nama'] ?? ''} - ${piket['tanggal'] ?? ''}',
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailPiketPage(
                                        nama: piket['nama'] ?? '',
                                        tanggal: piket['tanggal'] ?? '',
                                        tugas: piket['tugas'] ?? '',
                                      ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                )
                : const Center(child: Text('Belum ada data piket')),
          ],
        ),
      ),
    );
  }
}
