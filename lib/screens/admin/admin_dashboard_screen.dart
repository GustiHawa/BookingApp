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
                    child: _DashboardCard(
                      title: 'Verifikasi Pembayaran',
                      value: '2',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminVerificationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: _DashboardCard(
                      title: 'Komisi',
                      value: 'Rp. 30.000',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminCommissionreportScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              // Bagian Manajemen Tempat dan Persetujuan Tempat
              Row(
                children: [
                  Expanded(
                    child: _DashboardCard(
                      title: 'Manajemen Tempat',
                      value: '8',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminPlaceManageScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: _DashboardCard(
                      title: 'Persetujuan Tempat',
                      value: '5',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminVerificationPlaceScreen(),
                          ),
                        );
                      },
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

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                value,
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
