import 'package:flutter/material.dart';
import 'package:uasmp2_meryyulia_18111423/About.dart';
import 'package:uasmp2_meryyulia_18111423/AddDataTas.dart';
import 'package:uasmp2_meryyulia_18111423/DataTas.dart';
import 'package:uasmp2_meryyulia_18111423/HalamanListProduk.dart';
import 'Beranda.dart';
import 'HalamanLogin.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class PageHome extends StatefulWidget {
  final drawerItem = [
    new DrawerItem("Beranda", Icons.home),
    new DrawerItem("Produk", Icons.shop),
    new DrawerItem("Tambah Tas", Icons.add),
    new DrawerItem("Data Tas", Icons.data_usage),
    new DrawerItem("Akun", Icons.person),
    new DrawerItem("About", Icons.info),
  ];

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Beranda();
      case 1:
        return new Produk();
      case 2:
        return new AddData();
      case 3:
        return new DataTas();
      case 4:
        return new HalamanLogin();
      case 5:
        return new About();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); //close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItem.length; i++) {
      var d = widget.drawerItem[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        trailing: new Icon(Icons.arrow_right),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItem[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Mery Yulia"),
              accountEmail: Text("meriyulia684@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "Y",
                    style: TextStyle(fontSize: 25.0),
                  ),
                )
              ],
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
