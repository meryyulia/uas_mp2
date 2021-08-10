import 'package:flutter/material.dart';
import 'package:uasmp2_meryyulia_18111423/PageHome.dart';

class InfoAkun extends StatefulWidget {
  final String name, email, password;

  InfoAkun({@required this.name, this.email, this.password});

  @override
  _InfoAkunState createState() => _InfoAkunState();
}

class _InfoAkunState extends State<InfoAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PageHome()),
            );
          },
        ),
        title: Text('Informasi Akun'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://sosiologi.fisipol.ugm.ac.id/wp-content/uploads/sites/1453/2021/03/profil-biru.jpg',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 25,
              ),
            )),
            Center(
                child: Text(
              widget.email,
              style: TextStyle(
                fontSize: 25,
              ),
            )),
            Center(
                child: Text(
              widget.password,
              style: TextStyle(
                fontSize: 25,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
