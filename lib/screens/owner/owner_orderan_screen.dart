import 'package:flutter/material.dart';

class OwnerOrderanScreen extends StatefulWidget {
  const OwnerOrderanScreen({super.key});

  @override
  State<OwnerOrderanScreen> createState() => _OwnerOrderanScreenState();
}

class _OwnerOrderanScreenState extends State<OwnerOrderanScreen> {
  // Data pesanan sebagai contoh
  final List<Map<String, String>> orders = [
    {
      'namaCustomer': 'Nama Customer 1',
      'tanggal': '18/11/2024',
      'jumlahKursi': '4 Kursi',
      'harga': 'Rp. 50.000',
    },
    {
      'namaCustomer': 'Nama Customer 2',
      'tanggal': '18/11/2024',
      'jumlahKursi': '2 Kursi',
      'harga': 'Rp. 30.000',
    },
    // Tambahkan data pesanan lainnya jika perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Pesanan'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return _PesananItem(
            namaCustomer: orders[index]['namaCustomer']!,
            tanggal: orders[index]['tanggal']!,
            jumlahKursi: orders[index]['jumlahKursi']!,
            harga: orders[index]['harga']!,
          );
        },
      ),
    );
  }
}

class _PesananItem extends StatelessWidget {
  const _PesananItem({
    super.key,
    required this.namaCustomer,
    required this.tanggal,
    required this.jumlahKursi,
    required this.harga,
  });

  final String namaCustomer;
  final String tanggal;
  final String jumlahKursi;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            namaCustomer,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text('Tanggal: $tanggal'),
          Text('Jumlah Kursi: $jumlahKursi'),
          Text(
            'Harga: $harga',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk menandai pesanan selesai
                },
                child: const Text('Selesaikan'),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk membatalkan pesanan
                },
                child: const Text('Batalkan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna merah untuk batalkan
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
