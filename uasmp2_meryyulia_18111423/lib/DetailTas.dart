import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uasmp2_meryyulia_18111423/EditTas.dart';
import 'PageHome.dart';
import 'EditTas.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class Detailtas extends StatefulWidget {
  List list;
  int index;
  Detailtas({this.index, this.list});
  @override
  _DetailtasState createState() => new _DetailtasState();
}

class _DetailtasState extends State<Detailtas> {
  void deleteData() {
    var url = "https://latihanflutter.000webhostapp.com/deletetas.php";
    http.post(url, body: {'idtas': widget.list[widget.index]['id']});
    Fluttertoast.showToast(
        msg: "Kategori " +
            widget.list[widget.index]['nama_tas'] +
            " Berhasil Dihapus!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBar(title: new Text("${widget.list[widget.index]['nama_tas']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama_tas'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    new RaisedButton(
                        child: new Text("EDIT"),
                        color: Colors.green,
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Edittas(
                                      list: widget.list, index: widget.index)),
                            )),
                    // ignore: deprecated_member_use
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirm() {
    // ignore: unused_local_variable
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Anda yakin menghapus kategori ini? Nama Kategori : '${widget.list[widget.index]['nama_tas']}'"),
      actions: <Widget>[
        // ignore: deprecated_member_use
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new PageHome()),
            );
          },
        ),
        // ignore: deprecated_member_use
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
