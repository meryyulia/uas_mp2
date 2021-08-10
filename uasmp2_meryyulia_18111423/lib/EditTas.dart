import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PageHome.dart';

class Edittas extends StatefulWidget {
  final List list;
  final int index;

  Edittas({this.list, this.index});

  @override
  _EdittasState createState() => new _EdittasState();
}

class _EdittasState extends State<Edittas> {
  TextEditingController controllerKategori;

  void editData() {
    var url = "https://latihanflutter.000webhostapp.com/edittas.php";
    http.post(url, body: {
      "idkategori": widget.list[widget.index]['id'],
      "namakategori": controllerKategori.text
    });
  }

  @override
  void initState() {
    controllerKategori =
        new TextEditingController(text: widget.list[widget.index]['nama_tas']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: controllerKategori,
              decoration: new InputDecoration(
                  hintText: "Kategori", labelText: "Kategori"),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            // ignore: deprecated_member_use
            new RaisedButton(
              child: new Text("Edit Data"),
              color: Colors.blueAccent,
              onPressed: () {
                editData();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new PageHome()));
              },
            )
          ],
        ),
      ),
    );
  }
}
