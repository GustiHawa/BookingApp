import 'package:flutter/material.dart';

class AdminVerificationPlaceScreen extends StatefulWidget {
  const AdminVerificationPlaceScreen({super.key});

  @override
  State<AdminVerificationPlaceScreen> createState() =>
      _AdminVerificationPlaceScreenState();
}

class _AdminVerificationPlaceScreenState
    extends State<AdminVerificationPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Persetujuan Tempat'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Tempat untuk Verifikasi',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: size.width * 0.04,
                  columns: const [
                    DataColumn(label: Text('Nama Tempat')),
                    DataColumn(label: Text('Alamat')),
                    DataColumn(label: Text('Keterangan')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text('User 1')),
                        const DataCell(Text('JI. Anggur No. 3A, UPN')),
                        DataCell(
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              '/adminDetailPlace',
                              arguments: {
                                'name': 'User 1',
                                'address': 'Jl. Anggur No. 3A, UPN',
                                'facilities': 'Wi-Fi, Parkir',
                                'capacity': '40 Orang',
                                'description': 'Tempat nyaman dan strategis.',
                              },
                            ),
                            child: const Text('Detail'),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('User 2')),
                        const DataCell(Text('Jl. Anggur No. 3A, UPN')),
                        DataCell(
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/adminDetailPlaceScreen',
                                arguments: {
                                  'name': 'User 2',
                                  'address': 'Jl. Anggur No. 3A, UPN',
                                },
                              );
                            },
                            child: const Text('Detail'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
