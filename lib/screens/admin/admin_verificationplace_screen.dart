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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persetujuan Tempat'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          DataTable(
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
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/adminDetailPlace', // Pastikan nama rute sesuai dengan yang terdaftar
                            arguments: {
                              'name': 'User 2',
                              'address': 'Jl. Anggur No. 3A, UPN',
                              'facilities': 'Wi-Fi, Parkir',
                              'capacity': '40 Orang',
                              'description': 'Tempat nyaman dan strategis.',
                            },
                          );
                        },
                        child: const Text('Detail'),
                      )
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
        ],
      ),
    );
  }
}
