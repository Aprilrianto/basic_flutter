import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Color> colors = [
    Colors.white,
    const Color.fromARGB(255, 82, 163, 229), // Biru
    Colors.greenAccent.shade100, // Hijau Muda
    Colors.pinkAccent.shade100, // Pink
    Colors.orange.shade100, // Oranye
    const Color.fromARGB(255, 169, 2, 246), // Ungu
  ];

  int currentColorIndex = 0;

  void cycleBackgroundColor() {
    setState(() {
      currentColorIndex = (currentColorIndex + 1) % colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[currentColorIndex],
      appBar: AppBar(
        backgroundColor: colors[currentColorIndex],
        title: const Text("Profil"),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/tes.jpg'),
            ),
            const SizedBox(height: 20),
            Text(
              widget.email,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sukoharjo, Gentan',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              "Tekan Tombol Untuk Ganti Warna Background:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: cycleBackgroundColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Ganti Warna"),
            ),
          ],
        ),
      ),
    );
  }
}
