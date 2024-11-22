import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class UserPaymentScreen extends StatefulWidget {
  final String customerName;
  final String bookingDate;
  final int numberOfPeople;
  final int totalPrice;
  final String cafeName;

  const UserPaymentScreen({
    super.key,
    required this.customerName,
    required this.bookingDate,
    required this.numberOfPeople,
    required this.totalPrice,
    required this.cafeName,
  });

  @override
  State<UserPaymentScreen> createState() => _UserPaymentScreenState();
}

class _UserPaymentScreenState extends State<UserPaymentScreen> {
  Uint8List? _buktiTransfer;

  // Fungsi untuk mengambil gambar dari galeri
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes =
          await pickedFile.readAsBytes(); // Membaca file sebagai byte array
      setState(() {
        _buktiTransfer = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Silahkan Melakukan Pembayaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bayar dengan nominal yang tertera ke rekening berikut:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: const [
                    Text(
                      'TAGIHAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bank Mandiri',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '1400012345678901',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'a.n. Nama Pemilik Rekening',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nama Tempat:'),
                    const SizedBox(height: 5),
                    Text(
                      widget.cafeName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Nama Pengaju Booking:'),
                    const SizedBox(height: 5),
                    Text(
                      widget.customerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Jumlah Orang:'),
                    const SizedBox(height: 5),
                    Text(
                      widget.numberOfPeople.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Total Pembayaran:'),
                    const SizedBox(height: 5),
                    Text(
                      'Rp. ${widget.totalPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Unggah Bukti Transfer:'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Pilih Gambar'),
                    ),
                    const SizedBox(height: 10),
                    if (_buktiTransfer != null)
                      Column(
                        children: [
                          const Text(
                            'Bukti Transfer Terpilih:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Image.memory(
                            _buktiTransfer!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_buktiTransfer == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Harap unggah bukti transfer'),
                            ),
                          );
                        } else {
                          // Simpan atau kirim data pembayaran
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pembayaran berhasil disimpan'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Bayar Sekarang'),
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
