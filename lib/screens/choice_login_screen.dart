
import 'package:flutter/material.dart';

// Import halaman admin login
// Import halaman owner login

class ChoiceLoginScreen extends StatelessWidget {
  const ChoiceLoginScreen(
      {super.key}); // Perbaiki nama konstruktor sesuai dengan nama kelas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rumah Nugas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Rumah Nugas!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Log in now to continue',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/loginUser'); // Rute untuk user login
                },
                child: const Text(
                  'Pencari Tempat Nugas',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/loginPemilik'); // Rute untuk owner login
                },
                child: const Text(
                  'Pemilik Tempat Nugas',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 40), // Atur jarak dari kiri
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/loginAdmin'); // Rute untuk admin login
                  },
                  child: const Text(
                    'Login Admin',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(
            //         context, '/register'); // Rute untuk halaman register
            //   },
            //   child: const Text(
            //     'Belum daftar? Register dulu',
            //     style: TextStyle(fontSize: 16),
            //   ),
          //   ),
          ],
        ),
      ),
    );
  }
}
