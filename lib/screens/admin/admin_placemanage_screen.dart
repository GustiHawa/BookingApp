import 'package:flutter/material.dart';

class AdminPlaceManageScreen extends StatefulWidget {
  const AdminPlaceManageScreen({super.key});

  @override
  State<AdminPlaceManageScreen> createState() => _AdminPlaceManageScreenState();
}

class _AdminPlaceManageScreenState extends State<AdminPlaceManageScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Manajemen Tempat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Tempat',
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
                        DataCell(Text('Jl. Anggur, UPN')),
                        DataCell(Text('Aktif')),
                        DataCell(
                          IconButton(
                            onPressed: () {
                              // Implement Hapus logic
                            },
                            icon: const Icon(Icons.delete),
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
                            icon: const Icon(Icons.delete),
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
