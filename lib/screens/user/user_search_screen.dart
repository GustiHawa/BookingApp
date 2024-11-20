import 'package:flutter/material.dart';
import 'user_listcafe_screen.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _kampusController = TextEditingController();

  // Simulating a function that fetches cafes based on the campus
  Future<List<Map<String, String>>> _fetchCafes(String campusName) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));

    // For now, return a dummy list of cafes
    return [
      {
        'name': 'Cafe A',
        'location': 'Jl. Contoh No.1',
        'rating': '4.5',
        'priceRange': 'Rp 20.000 - Rp 50.000',
        'imageUrl': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Cafe B',
        'location': 'Jl. Contoh No.2',
        'rating': '4.0',
        'priceRange': 'Rp 25.000 - Rp 60.000',
        'imageUrl': 'https://via.placeholder.com/150',
      },
    ];
  }

  void _navigateToCafeList() {
    String inputKampus = _kampusController.text.trim();

    if (inputKampus.isNotEmpty) {
      // Show loading dialog while fetching cafes
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Fetch cafes and then navigate
      _fetchCafes(inputKampus).then((cafes) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context); // Dismiss loading indicator
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserListCafeScreen(
              kampus: inputKampus,
              warkopTerdekat:
                  cafes, // Pass the fetched cafes to the list screen
            ),
          ),
        );
      }).catchError((e) {
        Navigator.pop(context); // Dismiss loading indicator on error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi kesalahan, coba lagi!')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nama kampus terlebih dahulu!')),
      );
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
          children: [
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
