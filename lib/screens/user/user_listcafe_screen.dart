import 'package:flutter/material.dart';

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

  const UserListCafeScreen(
      {super.key, required this.kampus, required this.warkopTerdekat});

  @override
  State<UserListCafeScreen> createState() => _UserListCafeScreenState();
}

class _UserListCafeScreenState extends State<UserListCafeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Cafe di ${widget.kampus}'),
        actions: [
          IconButton(
            onPressed: () {
              // Tambahkan fungsi pencarian
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.warkopTerdekat.length,
        itemBuilder: (context, index) {
          final cafe = widget.warkopTerdekat[index];
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
                      image: NetworkImage(cafe.imageUrl), // URL gambar cafe
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
          );
        },
      ),
    );
  }
}
