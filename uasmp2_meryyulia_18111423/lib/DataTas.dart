import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:uasmp2_meryyulia_18111423/DetailTas.dart';

class DataTas extends StatefulWidget {
  @override
  _DataTasState createState() => _DataTasState();
}

class _DataTasState extends State<DataTas> {
  Future<List> getData() async {
    final response =
        await http.get("https://latihanflutter.000webhostapp.com/datatas.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        });
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detailtas(
                        list: list,
                        index: i,
                      ))),
              child: GestureDetector(
                child: new Card(
                  child: new ListTile(
                    title: new Text(list[i]['nama_tas']),
                    leading: new Icon(Icons.widgets),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
