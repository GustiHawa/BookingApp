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
    required this.imageUrl, required String details, required String cafeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isWideScreen ? 80 : 16,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Gambar Cafe
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      width: constraints.maxWidth > 800
                          ? 800
                          : constraints.maxWidth * 0.95,
                      height: constraints.maxWidth > 800
                          ? 400
                          : constraints.maxWidth * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Nama Tempat
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  // Lokasi Tempat
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Rating Tempat
                  Text(
                    'Rating: $rating',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Rentang Harga
                  Text(
                    'Harga: $priceRange',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Tombol Booking
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserBookingScreen(
                            cafeName: name,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      minimumSize: const Size(200, 50), // Ukuran minimal tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Booking Tempat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
