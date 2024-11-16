import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Kelas CafeWarkop untuk mendefinisikan data cafe
class CafeWarkop {
  final String name;
  final String location;
  final double rating;
  final int price;
  final String imageUrl;

  CafeWarkop(this.name, this.location, this.rating, this.price, this.imageUrl);
}

class UserListCafeScreen extends StatefulWidget {
  final String kampus;
  final List<CafeWarkop> warkopTerdekat;

  const UserListCafeScreen({
    super.key,
    required this.kampus,
    required this.warkopTerdekat,
  });

  @override
  State<UserListCafeScreen> createState() => _UserListCafeScreenState();
}

class _UserListCafeScreenState extends State<UserListCafeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Cafe di ${widget.kampus}'),
      ),
      body: ListView.builder(
        itemCount: widget.warkopTerdekat.length,
        itemBuilder: (context, index) {
          final cafe = widget.warkopTerdekat[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail cafe
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Menampilkan gambar cafe dengan CachedNetworkImage
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cafe.imageUrl,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
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
                          Text('Lokasi: ${cafe.location}'),
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
            ),
          );
        },
      ),
    );
  }
}

// Sample CafeWarkop list with image URLs
List<CafeWarkop> cafes = [
  CafeWarkop(
    'Cafe A',
    'Jl. Raya No. 1',
    4.5,
    50000,
    'https://images.unsplash.com/photo-1614313369929-3497c6e9ac8d', // Contoh URL gambar
  ),
  CafeWarkop(
    'Cafe B',
    'Jl. Raya No. 2',
    4.2,
    40000,
    'https://placekitten.com/200/200', // URL fallback
  ),
];
