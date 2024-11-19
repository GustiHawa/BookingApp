import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class UserDetailCafeScreen extends StatelessWidget {
  final String namaCafe;
  final String lokasiCafe;
  final String ratingCafe;
  final String deskripsiCafe;
  final String hargaCafe;
  // final String imageUrl;

  const UserDetailCafeScreen({
    super.key,
    required this.namaCafe,
    required this.lokasiCafe,
    required this.ratingCafe,
    required this.deskripsiCafe,
    required this.hargaCafe,
    // required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0", "id_ID");
    String formattedPrice = int.tryParse(hargaCafe) != null
        ? formatter.format(int.parse(hargaCafe))
        : 'N/A';

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
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     border: Border.all(color: Colors.blue),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(16.0),
              //     child: CachedNetworkImage(
              //       imageUrl: imageUrl.isNotEmpty
              //           ? imageUrl
              //           : 'https://via.placeholder.com/200',
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
              _buildDetailSection('Lokasi Tempat', lokasiCafe),
              _buildDetailSection('Rating Tempat', ratingCafe,
                  leading: const Icon(Icons.star, color: Colors.orange)),
              _buildDetailSection('Deskripsi Tempat', deskripsiCafe),
              _buildDetailSection('Harga', 'Rp. $formattedPrice'),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat bagian detail
  Widget _buildDetailSection(String title, String content, {Widget? leading}) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (leading != null) ...[
                leading,
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
