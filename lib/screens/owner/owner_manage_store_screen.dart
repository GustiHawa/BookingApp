import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:convert'; // Untuk encode/decode data gambar

class OwnerManageStoreScreen extends StatefulWidget {
  const OwnerManageStoreScreen({super.key});

  @override
  State<OwnerManageStoreScreen> createState() => _OwnerManageStoreScreenState();
}

class _OwnerManageStoreScreenState extends State<OwnerManageStoreScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Uint8List?> _selectedImages = [null, null, null]; // Untuk 3 foto
  final TextEditingController _namaTempatController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _kapasitasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData(); // Muat data dari SharedPreferences
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaTempatController.text = prefs.getString('namaTempat') ?? '';
      _alamatController.text = prefs.getString('alamat') ?? '';
      _fasilitasController.text = prefs.getString('fasilitas') ?? '';
      _kapasitasController.text = prefs.getString('kapasitas') ?? '';

      for (int i = 0; i < 3; i++) {
        final String? imageData = prefs.getString('image$i');
        if (imageData != null) {
          _selectedImages[i] = base64Decode(imageData);
        }
      }
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('namaTempat', _namaTempatController.text);
    await prefs.setString('alamat', _alamatController.text);
    await prefs.setString('fasilitas', _fasilitasController.text);
    await prefs.setString('kapasitas', _kapasitasController.text);

    for (int i = 0; i < 3; i++) {
      if (_selectedImages[i] != null) {
        final String imageData = base64Encode(_selectedImages[i]!);
        await prefs.setString('image$i', imageData);
      }
    }
  }

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _selectedImages[index] = imageBytes;
      });
    }
  }

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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _namaTempatController,
                  decoration: const InputDecoration(labelText: 'Nama Tempat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tempat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _fasilitasController,
                  decoration: const InputDecoration(labelText: 'Fasilitas'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fasilitas tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _kapasitasController,
                  decoration: const InputDecoration(labelText: 'Kapasitas'),
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
                const Text(
                  'Foto Tempat (Maksimal 3)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                ...List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => _pickImage(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: _selectedImages[index] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(
                                _selectedImages[index]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Ketuk untuk memilih foto',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _saveData();
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
