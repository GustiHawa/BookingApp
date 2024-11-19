import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerInfopribadiScreen extends StatefulWidget {
  const OwnerInfopribadiScreen({super.key});

  @override
  _OwnerInfopribadiScreenState createState() => _OwnerInfopribadiScreenState();
}

class _OwnerInfopribadiScreenState extends State<OwnerInfopribadiScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk form
  late TextEditingController _namaBankController;
  late TextEditingController _nomorRekeningController;
  late TextEditingController _namaPemilikController;

  @override
  void initState() {
    super.initState();
    // Memuat data dari SharedPreferences saat halaman dimulai
    _initializeData();
  }

  Future<void> _initializeData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaBankController =
          TextEditingController(text: prefs.getString('namaBank') ?? 'Mandiri');
      _nomorRekeningController = TextEditingController(
          text: prefs.getString('nomorRekening') ?? '14000xxxxxXXXXXXXXXX');
      _namaPemilikController = TextEditingController(
          text: prefs.getString('namaPemilik') ?? 'Gusti Hawa');
    });
  }

  Future<void> _simpanData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('namaBank', _namaBankController.text);
    await prefs.setString('nomorRekening', _nomorRekeningController.text);
    await prefs.setString('namaPemilik', _namaPemilikController.text);

    // Menampilkan notifikasi bahwa data berhasil disimpan
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan')),
    );
  }

  @override
  void dispose() {
    _namaBankController.dispose();
    _nomorRekeningController.dispose();
    _namaPemilikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Informasi Pribadi'),
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaBankController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Bank',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama bank tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nomorRekeningController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor Rekening',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor rekening tidak boleh kosong';
                      }
                      if (value.length != 16) {
                        return 'Nomor rekening harus 16 digit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _namaPemilikController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pemilik',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama pemilik tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _simpanData();
                      }
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
