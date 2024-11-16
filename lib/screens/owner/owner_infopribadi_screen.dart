import 'package:flutter/material.dart';

class OwnerInfopribadiScreen extends StatefulWidget {
  const OwnerInfopribadiScreen({super.key});

  @override
  _OwnerInfopribadiScreenState createState() => _OwnerInfopribadiScreenState();
}

class _OwnerInfopribadiScreenState extends State<OwnerInfopribadiScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaBankController = TextEditingController(text: 'Mandiri');
  final _nomorRekeningController = TextEditingController(text: '14000xxxxxXXXXXXXXXX');
  final _namaPemilikController = TextEditingController(text: 'Gusti Hawa');

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
      body: Form(
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
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data berhasil disimpan')),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}