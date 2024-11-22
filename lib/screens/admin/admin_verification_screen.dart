import 'package:flutter/material.dart';

// Gunakan alias untuk mengimpor AdminDetailPaymentScreen dari file lain
import 'admin_detailpayment_screen.dart' as adminDetailScreen;

class AdminVerificationScreen extends StatefulWidget {
  const AdminVerificationScreen({super.key});

  @override
  State<AdminVerificationScreen> createState() =>
      _AdminVerificationScreenState();
}

class _AdminVerificationScreenState extends State<AdminVerificationScreen> {
  // Daftar pembayaran yang akan ditampilkan
  List<Pembayaran> pembayaranList = [
    Pembayaran(
      nomor: 1,
      namaCustomer: 'John Doe',
      tanggal: '18/11/2024',
      jumlahKursi: '50.000',
      waktu: '11.00 AM',
      buktiTransfer: 'https://via.placeholder.com/150',
    ),
    Pembayaran(
      nomor: 2,
      namaCustomer: 'Jane Smith',
      tanggal: '23/11/2024',
      jumlahKursi: '30.000',
      waktu: '01.00 PM',
      buktiTransfer: 'https://via.placeholder.com/150',
    ),
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
        title: const Text('Verifikasi Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pembayaranList.length,
          itemBuilder: (context, index) {
            final pembayaran = pembayaranList[index];
            return _PembayaranItem(
              pembayaran: pembayaran,
              onTerima: () {
                setState(() {
                  pembayaranList
                      .removeAt(index); // Hapus pembayaran dari daftar
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking diterima')),
                );
              },
              onTolak: () {
                setState(() {
                  pembayaranList
                      .removeAt(index); // Hapus pembayaran dari daftar
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking ditolak')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _PembayaranItem extends StatelessWidget {
  const _PembayaranItem({
    required this.pembayaran,
    required this.onTerima,
    required this.onTolak,
  });

  final Pembayaran pembayaran;
  final VoidCallback onTerima;
  final VoidCallback onTolak;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pembayaran.nomor}. ${pembayaran.namaCustomer}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Tanggal: ${pembayaran.tanggal}'),
            Text('Jumlah Kursi: ${pembayaran.jumlahKursi}'),
            Text('Waktu: ${pembayaran.waktu}'),
            const SizedBox(height: 8.0),
            const Text(
              'Bukti Transfer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman detail pembayaran menggunakan alias
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        adminDetailScreen.AdminDetailPaymentScreen(
                      buktiTransfer:
                          pembayaran.buktiTransfer, // Kirim data bukti transfer
                    ),
                  ),
                );
              },
              child: const Text(
                'Lihat Bukti Pembayaran',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: onTerima,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Terima'),
                ),
                ElevatedButton(
                  onPressed: onTolak,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Tolak'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Model untuk menyimpan informasi pembayaran
class Pembayaran {
  Pembayaran({
    required this.nomor,
    required this.namaCustomer,
    required this.tanggal,
    required this.jumlahKursi,
    required this.waktu,
    required this.buktiTransfer,
  });

  final int nomor;
  final String namaCustomer;
  final String tanggal;
  final String jumlahKursi;
  final String waktu;
  final String buktiTransfer;
}
