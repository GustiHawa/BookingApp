import 'package:flutter/material.dart';
import 'user_booking_screen.dart'; // Pastikan Anda mengimpor halaman UserBookingScreen

class UserDetailCafeScreen extends StatelessWidget {
  final String name;
  final String location;
  final String rating;
  final String priceRange;
  final String imageUrl;

  const UserDetailCafeScreen({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.priceRange,
    required this.imageUrl, required String cafeName, required String details,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints:
                const BoxConstraints(maxWidth: 600), // Maksimal lebar 600px
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar Cafe
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: screenWidth * 0.9, // Menyesuaikan lebar gambar
                    height: screenHeight * 0.3, // Menyesuaikan tinggi gambar
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // Nama Tempat
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                // Lokasi Tempat
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                // Rating Tempat
                Text(
                  'Rating: $rating',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Deskripsi Tempat
                const Text(
                  'Deskripsi Tempat',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Rentang Harga
                Text(
                  'Harga: $priceRange',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Tombol Booking
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserBookingScreen(
                          cafeName: name, // Kirim nama kafe ke halaman booking
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Booking Tempat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
