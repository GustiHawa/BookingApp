import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

// Kelas CafeWarkop untuk mendefinisikan data cafe
class CafeWarkop {
  final String name;
  final String location;
  final double rating;
  final int price;
  // final String imageUrl;
  final String description;

  CafeWarkop({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    // required this.imageUrl,
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
      body: widget.warkopTerdekat.isEmpty
          ? Center(
              child: Text(
                'Tidak ada cafe di sekitar ${widget.kampus}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.warkopTerdekat.length,
              itemBuilder: (context, index) {
                final cafe = widget.warkopTerdekat[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail cafe
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
                        // Menampilkan gambar cafe
                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   margin: const EdgeInsets.all(8),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: CachedNetworkImage(
                        //     imageUrl: cafe.imageUrl,
                        //     placeholder: (context, url) => const Center(
                        //       child: CircularProgressIndicator(),
                        //     ),
                        //     errorWidget: (context, url, error) =>
                        //         const Icon(Icons.error),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
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
                                    const Icon(Icons.star,
                                        color: Colors.orange),
                                    Text(cafe.rating.toString()),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Harga: Rp. ${NumberFormat('#,###').format(cafe.price)}',
                                ),
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
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     border: Border.all(color: Colors.blue),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(16.0),
              //     child: CachedNetworkImage(
              //       imageUrl: cafe.imageUrl,
              //       placeholder: (context, url) => const Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //       errorWidget: (context, url, error) =>
              //           const Icon(Icons.error),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16.0),
              _buildDetailSection('Lokasi Tempat', cafe.location),
              _buildDetailSection('Rating Tempat', '${cafe.rating} / 5'),
              _buildDetailSection('Deskripsi Tempat', cafe.description),
              _buildDetailSection(
                'Harga',
                'Rp. ${NumberFormat('#,###').format(cafe.price)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk bagian detail
  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            content,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
