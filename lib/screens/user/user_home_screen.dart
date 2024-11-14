import 'package:flutter/material.dart';
import 'user_notification_screen.dart'; // Import halaman notifikasi
import 'user_history_screen.dart'; // Import halaman riwayat booking
import 'user_search_screen.dart'; // Import halaman pencarian kampus

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key}); // Convert 'key' to a super parameter and make constructor const

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Set key untuk Scaffold
      appBar: AppBar(
        title: const Text("RUMAH NUGAS"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer(); // Gunakan scaffoldKey untuk membuka drawer
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifikasi'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserNotificationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Riwayat Booking'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserHistoryScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                // Arahkan kembali ke halaman login
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cari dan booking tempat nongkrong dan nugas dengan mudah...",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              readOnly: true, // Membuat TextField hanya dapat dibaca
              onTap: () {
                // Navigasi ke UserSearchScreen ketika TextField diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserSearchScreen(),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "Masukkan nama kampus mu...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: List.generate(
                  4,
                  (i) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                        ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tempat yg sering dikunjungi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Icon(
                          Icons.place,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
