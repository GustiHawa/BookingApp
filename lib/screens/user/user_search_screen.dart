import 'package:flutter/material.dart';

// Mock data for cafes and warkops around campuses
class CafeWarkop {
  final String name;
  final String campus;

  CafeWarkop(this.name, this.campus);
}

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {

  final Map<String, List<CafeWarkop>> _cafes = {
    'Kampus 1': [
      CafeWarkop('Cafe A', 'Kampus 1'),
      CafeWarkop('Warkop B', 'Kampus 1'),
    ],
    'Kampus 2': [
      CafeWarkop('Cafe C', 'Kampus 2'),
      CafeWarkop('Warkop D', 'Kampus 2'),
    ],
    'Kampus 3': [
      CafeWarkop('Cafe E', 'Kampus 3'),
    ],
    // Add more campuses and cafes/warkops here
  };

  final TextEditingController _kampusController = TextEditingController();

  // Function to navigate to the cafe list screen
  void _navigateToCafeList() {
    String inputKampus = _kampusController.text.trim();
    if (inputKampus.isNotEmpty && _cafes.containsKey(inputKampus)) {
      // Navigate to UserListCafeScreen with the campus name
      Navigator.pushNamed(
        context,
        '/userListcafe',
        arguments: {'kampus': inputKampus, 'cafes': _cafes[inputKampus]},
      );
    } else {
      // Show an error if the kampus is not in the list
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kampus tidak ditemukan!')),
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
