import 'package:flutter/material.dart';
import 'owner_notification_screen.dart';
import 'owner_infopribadi_screen.dart';
import '../choice_login_screen.dart'; // Pastikan ChoiceLoginScreen sudah diimpor dengan benar
import 'owner_manage_store_screen.dart'; // Pastikan file ini sudah ada
import 'owner_orderan_screen.dart'; // Pastikan file ini sudah ada
import 'owner_history_screen.dart'; // Pastikan file ini sudah ada
import 'owner_balance_report_screen.dart'; // Pastikan file ini sudah ada

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
        builder: (context) => const ChoiceLoginScreen(),
      ),
    );
  }

  // Fungsi navigasi untuk mengurangi pengulangan
  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Daftar menu yang akan ditampilkan
    final menuItems = [
      _MenuItem(
          Icons.person, 'Informasi Pribadi', const OwnerInfopribadiScreen()),
      _MenuItem(
          Icons.notifications, 'Notifikasi', const OwnerNotificationScreen()),
      _MenuItem(Icons.grid_view, 'Kelola',
          const OwnerManageStoreScreen()), // Diperbarui
      _MenuItem(Icons.add_circle_outline, 'Pesanan',
          const OwnerOrderanScreen()), // Diperbarui
      _MenuItem(Icons.receipt_long, 'Riwayat Pesanan',
          const OwnerHistoryScreen()), // Diperbarui
      _MenuItem(
          Icons.money, 'Laporan Keuangan', OwnerBalanceReportScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nama Tempat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                  onTap: () => _navigateToScreen(item.screen),
                );
              },
            ),
          ),
          // Tombol logout di bagian bawah
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna tombol
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Kelas untuk menyimpan informasi menu
class _MenuItem {
  final IconData icon;
  final String title;
  final Widget screen;

  _MenuItem(this.icon, this.title, this.screen);
}
