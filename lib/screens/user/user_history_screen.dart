import 'package:flutter/material.dart';

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Riwayat Booking'),
      ),
      body: const Center(
        child: Text(
          'Belum ada riwayat booking',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
