import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://st3.depositphotos.com/1393072/37667/v/600/depositphotos_376678060-stock-illustration-tablet-and-shopping-bag-flat.jpg',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              "Selamat Datang di Bag Shop tempat penjualan tas wanita",
              style: TextStyle(
                fontSize: 20.0,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
