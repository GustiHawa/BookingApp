import 'package:flutter/material.dart';

class UserDetailCafeScreen extends StatelessWidget {
  final String namaCafe;
  final String lokasiCafe;
  final String ratingCafe;
  final String deskripsiCafe;
  final String hargaCafe;
  final String imageUrl; // Menambahkan parameter imageUrl untuk gambar cafe

  const UserDetailCafeScreen({
    super.key,
    required this.namaCafe,
    required this.lokasiCafe,
    required this.ratingCafe,
    required this.deskripsiCafe,
    required this.hargaCafe,
    required this.imageUrl, // Menambahkan parameter imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaCafe),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar cafe
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.blue),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    imageUrl, // Menggunakan imageUrl yang diterima
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lokasi Tempat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                lokasiCafe,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Rating Tempat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                ratingCafe,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Deskripsi Tempat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                deskripsiCafe,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Harga',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Rp. $hargaCafe', // Menambahkan format Rp. pada harga
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
