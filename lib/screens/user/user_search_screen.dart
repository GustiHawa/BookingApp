import 'package:flutter/material.dart';

// Mock data for cafes and warkops around campuses
class CafeWarkop {
  final String name;
  final String campus;
  final double rating;
  final int price;
  final String imageUrl;

  // Perbaiki konstruktor untuk menambahkan parameter yang hilang
  CafeWarkop(this.name, this.campus, this.rating, this.price, this.imageUrl);
}

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  // Data cafe yang sudah diperbaiki
  final Map<String, List<CafeWarkop>> _cafes = {
    'Kampus 1': [
      CafeWarkop(
          'Cafe A', 'Kampus 1', 4.5, 20000, 'https://example.com/cafe_a.jpg'),
      CafeWarkop('Warkop B', 'Kampus 1', 4.0, 15000,
          'https://example.com/warkop_b.jpg'),
    ],
    'Kampus A': [
      // Pastikan ada 'Kampus A' di sini
      CafeWarkop(
          'Cafe A', 'Kampus A', 4.5, 20000, 'https://example.com/cafe_a.jpg'),
      CafeWarkop('Warkop B', 'Kampus A', 4.0, 15000,
          'https://example.com/warkop_b.jpg'),
    ],
    'Kampus 3': [
      CafeWarkop(
          'Cafe C', 'Kampus 3', 4.3, 25000, 'https://example.com/cafe_c.jpg'),
    ],
  };

  final TextEditingController _kampusController = TextEditingController();

  // Function to navigate to the cafe list screen
  void _navigateToCafeList() {
    // Ambil input dan ubah menjadi huruf kapital agar pencarian tidak peka terhadap kapitalisasi
    String inputKampus = _kampusController.text
        .trim()
        .toLowerCase(); // Menambahkan .toLowerCase()
    print('Input Kampus: $inputKampus'); // Debugging, print input

    // Periksa apakah kampus yang dimasukkan ada di dalam map
    if (inputKampus.isNotEmpty) {
      // Gunakan .toLowerCase() untuk memeriksa apakah nama kampus ada di dalam map
      final matchingKampus = _cafes.keys.firstWhere(
        (key) => key.toLowerCase() == inputKampus,
        orElse: () => '', // Jika tidak ditemukan, return string kosong
      );

      if (matchingKampus.isNotEmpty) {
        // Jika kampus ditemukan, navigasi ke UserListCafeScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserListCafeScreen(
              kampus: matchingKampus, // Mengirimkan nama kampus yang ditemukan
              warkopTerdekat: _cafes[
                  matchingKampus]!, // Mengirimkan daftar cafe yang relevan
            ),
          ),
        );
      } else {
        // Jika kampus tidak ditemukan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kampus tidak ditemukan!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Kampus dan Cafe/Warkop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField to input campus name
            TextField(
              controller: _kampusController,
              decoration: InputDecoration(
                labelText: 'Masukkan nama kampusmu...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Button to search and navigate to UserListCafeScreen
            ElevatedButton(
              onPressed: _navigateToCafeList,
              child: const Text('Cari'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserListCafeScreen extends StatelessWidget {
  final String kampus;
  final List<CafeWarkop> warkopTerdekat;

  const UserListCafeScreen(
      {super.key, required this.kampus, required this.warkopTerdekat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Cafe di $kampus'),
      ),
      body: ListView.builder(
        itemCount: warkopTerdekat.length,
        itemBuilder: (context, index) {
          final cafe = warkopTerdekat[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Menampilkan gambar cafe
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(cafe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Menampilkan detail cafe
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cafe.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Lokasi: ${cafe.campus}'),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange),
                            Text(cafe.rating.toString()),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Harga: Rp. ${cafe.price}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
