import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text("Profile $nama"),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, size: 40),
          Icon(Icons.person, size: 40),
          Icon(Icons.list, size: 40),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile.jpg"), // Gambar profil default
                  backgroundColor: Colors.pink[100],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.edit, size: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Nama: April Rianto", style: TextStyle(fontSize: 18)),
            Text("Alamat: Solo", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}