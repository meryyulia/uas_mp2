import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
            "Bag Shop",
            style: TextStyle(
              fontSize: 18,
              height: 2,
              fontStyle: FontStyle.italic,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
              "Bag shop adalah sebuah toko online yang menjual jenis tas wanita dengan bermacam-macam brand. Untuk mengetahui info lebih lengkap mengenai produk, proses order, dan pengiriman silahkan menghubungi customer service kami"),
          Text("Jam kerja."),
          Text("Senin-Sabtu : 08:00 - 20:00"),
          Text("No. Telepon : 087654321789"),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          "@Copyright by Mery Yulia_18111423_TIF RM 18 CID B",
          style: TextStyle(
            fontSize: 15,
            height: 2,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
