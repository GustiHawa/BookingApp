import 'package:flutter/material.dart';

// Pastikan untuk mengimpor UserPaymentScreen
import 'user_payment_screen.dart';

class UserBookingScreen extends StatefulWidget {
  const UserBookingScreen({super.key, required String cafeName});

  @override
  State<UserBookingScreen> createState() => _UserBookingScreenState();
}

class _UserBookingScreenState extends State<UserBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  int _numberOfPeople = 5;
  final int pricePerPerson = 5000; // Harga per orang

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hitung total harga berdasarkan jumlah orang
    int totalPrice = _numberOfPeople * pricePerPerson;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukkan nama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Booking',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan pilih tanggal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Jumlah Orang'),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_numberOfPeople > 1) {
                            setState(() {
                              _numberOfPeople--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('$_numberOfPeople'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _numberOfPeople++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // Menampilkan total harga
              Text(
                'Total Harga: Rp ${totalPrice.toString()}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigasi ke halaman pembayaran (UserPaymentScreen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPaymentScreen(
                          customerName: _nameController.text,
                          bookingDate: _dateController.text,
                          numberOfPeople: _numberOfPeople,
                          totalPrice: totalPrice, cafeName: '', // Kirim total harga
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Booking Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
