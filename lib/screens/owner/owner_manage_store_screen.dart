import 'package:flutter/material.dart';

class OwnerManageStoreScreen extends StatefulWidget {
  const OwnerManageStoreScreen({super.key});

  @override
  State<OwnerManageStoreScreen> createState() => _OwnerManageStoreScreenState();
}

class _OwnerManageStoreScreenState extends State<OwnerManageStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Tempat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kelola Tempat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Tempat',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tempat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Fasilitas',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fasilitas tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Kapasitas',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kapasitas tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Kapasitas harus berupa angka';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proses data jika valid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Data berhasil disimpan!')),
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
