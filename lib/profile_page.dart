import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color backgroundColor = Colors.white;

  final Map<String, Color> colorOptions = {
    'Putih': Colors.white,
    'Biru': const Color.fromARGB(255, 82, 163, 229),
    'Hijau Muda': Colors.green.shade100,
    'Pink': Colors.pink.shade100,
    'Oranye': Colors.orange.shade100,
    'Ungu': const Color.fromARGB(255, 169, 2, 246),
  };

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
              'Sukoharjo,Gentan',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              "Pilih Warna Background:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children:
                  colorOptions.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: entry.value,
                          foregroundColor:
                              entry.value.computeLuminance() > 0.5
                                  ? Colors.black
                                  : Colors.white,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => changeBackgroundColor(entry.value),
                        child: Text('Warna ${entry.key}'),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
