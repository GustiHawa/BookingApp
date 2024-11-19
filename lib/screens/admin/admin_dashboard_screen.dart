import 'package:flutter/material.dart';

// Import layar yang diperlukan
import 'admin_verification_screen.dart';
import 'admin_commissionreport_screen.dart';
import 'admin_placemanage_screen.dart';
import 'admin_verificationplace_screen.dart';
import 'admin_notification_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminNotificationScreen(),
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ringkasan Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
              SizedBox(height: size.height * 0.02),

              // Bagian Verifikasi dan Komisi
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminVerificationScreen(),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verifikasi Pembayaran',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminCommissionreportScreen(),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Komisi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                'Rp. 30.000',
                                style: TextStyle(
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              // Bagian Manajemen Tempat dan Persetujuan Tempat
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminPlaceManageScreen(),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Manajemen Tempat',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                '8',
                                style: TextStyle(
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminVerificationPlaceScreen(),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Persetujuan Tempat',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
