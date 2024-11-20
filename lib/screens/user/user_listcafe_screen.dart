import 'package:flutter/material.dart';
import 'user_detailcafe_screen.dart';

class UserListCafeScreen extends StatelessWidget {
  final String kampus;
  final List<Map<String, String>> warkopTerdekat; // Perbaiki parameter

  // Constructor dengan parameter
  const UserListCafeScreen({
    super.key,
    required this.kampus,
    required this.warkopTerdekat,
  });

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

          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail cafe
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailCafeScreen(
                    name: cafe['name']!,
                    location: cafe['location']!,
                    rating: cafe['rating']!,
                    priceRange: cafe['priceRange']!,
                    imageUrl: cafe['imageUrl']!,
                    cafeName: cafe['name']!,
                    details: '', // Sesuaikan dengan data yang ada
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Row(
                children: [
                  // Image
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(cafe['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cafe['name']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          cafe['location']!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text('Rating: ${cafe['rating']}'),
                        Text('Harga: ${cafe['priceRange']}'),
                      ],
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
