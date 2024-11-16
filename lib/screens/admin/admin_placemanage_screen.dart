import 'package:flutter/material.dart';

class AdminPlaceManageScreen extends StatefulWidget {
  const AdminPlaceManageScreen({super.key});

  @override
  State<AdminPlaceManageScreen> createState() => _AdminPlaceManageScreenState();
}

class _AdminPlaceManageScreenState extends State<AdminPlaceManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Manajemen Tempat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar Tempat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Nama')),
                      DataColumn(label: Text('Lokasi')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Hapus')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('1')),
                          DataCell(Text('Warkop A')),
                          DataCell(Text('Jl. anggur, UPN')),
                          DataCell(Text('Aktif')),
                          DataCell(
                            IconButton(
                              onPressed: () {
                                // Implement Hapus logic
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('2')),
                          DataCell(Text('Cafe B')),
                          DataCell(Text('Jl. Pukis, ITS')),
                          DataCell(Text('Aktif')),
                          DataCell(
                            IconButton(
                              onPressed: () {
                                // Implement Hapus logic
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
