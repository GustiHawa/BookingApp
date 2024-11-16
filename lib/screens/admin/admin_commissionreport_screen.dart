import 'package:flutter/material.dart';

class AdminCommissionreportScreen extends StatefulWidget {
  const AdminCommissionreportScreen({super.key});

  @override
  State<AdminCommissionreportScreen> createState() =>
      _AdminCommissionreportScreenState();
}

class _AdminCommissionreportScreenState
    extends State<AdminCommissionreportScreen> {
  final List<Map<String, dynamic>> _data = [
    {
      'tanggal': '01/11/2024',
      'user': 'Haidar',
      'total': 'Rp. 50.000',
      'komisi': 'Rp. 5000'
    },
    {
      'tanggal': '11/11/2024',
      'user': 'Eko Pat',
      'total': 'Rp. 100.000',
      'komisi': 'Rp. 10.000'
    },
    {
      'tanggal': '20/11/2024',
      'user': 'Khansa',
      'total': 'Rp. 80.000',
      'komisi': 'Rp. 8000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Komisi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: 'November 2024',
                items: const [
                  DropdownMenuItem(
                    value: 'November 2024',
                    child: Text('November 2024'),
                  ),
                  DropdownMenuItem(
                    value: 'Desember 2024',
                    child: Text('Desember 2024'),
                  ),
                  DropdownMenuItem(
                    value: 'Januari 2025',
                    child: Text('Januari 2025'),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              Text(
                'Daftar Laporan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Tanggal')),
                  DataColumn(label: Text('User ')),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Komisi')),
                ],
                rows: _data.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['tanggal'])),
                    DataCell(Text(item['user'])),
                    DataCell(Text(item['total'])),
                    DataCell(Text(item['komisi'])),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
