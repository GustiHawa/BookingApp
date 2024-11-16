import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Kelas CafeWarkop untuk mendefinisikan data cafe
class CafeWarkop {
  final String name;
  final String location;
  final double rating;
  final int price;
  final String imageUrl;
  final String description;

  CafeWarkop({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
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
              // Navigasi ke halaman detail cafe dengan mengirimkan data cafe
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailCafeScreen(cafe: cafe),
                ),
              );
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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

class UserDetailCafeScreen extends StatelessWidget {
  final CafeWarkop cafe;

  const UserDetailCafeScreen({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cafe.name),
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
                    cafe.imageUrl, // Menggunakan imageUrl dari objek CafeWarkop
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
                cafe.location,
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
                '${cafe.rating} / 5',
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
                'Cafe ini menawarkan suasana yang nyaman dengan pemandangan indah dan berbagai pilihan minuman dan makanan ringan.',
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
                'Rp. ${cafe.price}', // Menambahkan format Rp. pada harga
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
