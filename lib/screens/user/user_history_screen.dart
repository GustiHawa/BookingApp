import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserHistoryScreen(),
  ));
}

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Booking',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Tambahkan logika navigasi di sini
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Tambahkan logika notifikasi di sini
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Tambahkan logika pencarian di sini
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            BookingItem(
              imageUrl:
                  'https://storage.googleapis.com/a1aa/image/z0b34Ic8kSpnNZufeBpuoe2tqOAfEEZrQPPxabBqEHO2EULPB.jpg',
              placeName: 'Cafe Sunset',
              date: '18/11/2024',
              address: 'Jl. Kenangan No. 21',
              numberOfPeople: '2 Orang',
              price: 'Rp. 50.000',
              status: 'Berhasil',
            ),
            BookingItem(
              imageUrl:
                  'https://storage.googleapis.com/a1aa/image/z0b34Ic8kSpnNZufeBpuoe2tqOAfEEZrQPPxabBqEHO2EULPB.jpg',
              placeName: 'Kedai Kopi Surabaya',
              date: '18/11/2024',
              address: 'Jl. Harmoni No. 10',
              numberOfPeople: '4 Orang',
              price: 'Rp. 80.000',
              status: 'Menunggu Konfirmasi',
            ),
          ],
        ),
      ),
    );
  }
}

class BookingItem extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String date;
  final String address;
  final String numberOfPeople;
  final String price;
  final String status;

  const BookingItem({super.key,
    required this.imageUrl,
    required this.placeName,
    required this.date,
    required this.address,
    required this.numberOfPeople,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    address,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    numberOfPeople,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Chip(
                    label: Text(
                      status,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        status == 'Berhasil' ? Colors.green : Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
