import 'package:flutter/material.dart';
import 'owner_notification_screen.dart';
import 'owner_infopribadi_screen.dart';
import '../choice_login_screen.dart'; // Pastikan ChoiceLoginScreen sudah diimpor dengan benar

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  // Fungsi untuk logout
  void _logout() {
    // Navigasi langsung ke halaman choice login setelah logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ChoiceLoginScreen(), // Langsung ke halaman ChoiceLoginScreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nama Tempat'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Informasi Pribadi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OwnerInfopribadiScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OwnerNotificationScreen(),
                ),
              );
            },
          ),
          // Menambahkan kembali menu Kelola, Pesanan, Riwayat Pesanan, dan Laporan Keuangan
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Kelola'),
            onTap: () {
              // Ganti dengan navigasi ke halaman pengelolaan yang sesuai
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const OwnerManageScreen(), // Ganti dengan halaman pengelolaan
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Pesanan'),
            onTap: () {
              // Ganti dengan navigasi ke halaman pesanan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const OwnerOrderScreen(), // Ganti dengan halaman pesanan
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Riwayat Pesanan'),
            onTap: () {
              // Ganti dengan navigasi ke halaman riwayat pesanan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const OwnerOrderHistoryScreen(), // Ganti dengan halaman riwayat pesanan
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Laporan Keuangan'),
            onTap: () {
              // Ganti dengan navigasi ke halaman laporan keuangan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const OwnerFinancialReportScreen(), // Ganti dengan halaman laporan keuangan
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _logout, // Menambahkan logika logout
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Logout Akun',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Definisikan kelas-kelas halaman yang sesuai jika belum ada
class OwnerManageScreen extends StatelessWidget {
  const OwnerManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola'),
      ),
      body: const Center(
        child: Text('Halaman Kelola'),
      ),
    );
  }
}

class OwnerOrderScreen extends StatelessWidget {
  const OwnerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
      ),
      body: const Center(
        child: Text('Halaman Pesanan'),
      ),
    );
  }
}

class OwnerOrderHistoryScreen extends StatelessWidget {
  const OwnerOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
      ),
      body: const Center(
        child: Text('Halaman Riwayat Pesanan'),
      ),
    );
  }
}

class OwnerFinancialReportScreen extends StatelessWidget {
  const OwnerFinancialReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Keuangan'),
      ),
      body: const Center(
        child: Text('Halaman Laporan Keuangan'),
      ),
    );
  }
}
