import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/detail_page_pelanggan.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});
  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  bool _autoValidate = false;

  void resetForm() {
    namaController.clear();
    emailController.clear();
    hpController.clear();
    alamatController.clear();
    provinsiController.clear();
    kodePosController.clear();
    _formKey.currentState?.reset();
    setState(() {
      _autoValidate = false; // Reset autovalidasi juga
    });
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required String errorMsg,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: buildInputDecoration(label),
          autovalidateMode:
              _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
          onChanged: (value) {
            if (_autoValidate) {
              _formKey.currentState
                  ?.validate(); // kalau sudah autoValidate, realtime cek
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 162, 194),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Data Pelanggan',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                label: 'Nama Pelanggan',
                controller: namaController,
                errorMsg: 'pelanggan tidak boleh kosong',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Email',
                      controller: emailController,
                      errorMsg: 'Email tidak boleh kosong',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: buildTextField(
                      label: 'No Hp',
                      controller: hpController,
                      errorMsg: 'No Hp tidak boleh kosong',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              buildTextField(
                label: 'Alamat',
                controller: alamatController,
                errorMsg: 'Alamat tidak boleh kosong',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Provinsi',
                      controller: provinsiController,
                      errorMsg: 'Provinsi tidak boleh kosong',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: buildTextField(
                      label: 'Kode Pos',
                      controller: kodePosController,
                      errorMsg: 'Kode Pos tidak boleh kosong',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 49, 162, 194),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _autoValidate = true; // Mulai autovalidasi
                    });
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailPelangganPage(
                                nama: namaController.text,
                                email: emailController.text,
                                noHp: hpController.text,
                                alamat: alamatController.text,
                                provinsi: provinsiController.text,
                                kodepos: kodePosController.text,
                              ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Tombol Reset
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: const Color.fromARGB(255, 49, 162, 194),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: resetForm,
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
