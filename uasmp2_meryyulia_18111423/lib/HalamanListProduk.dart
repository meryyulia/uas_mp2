import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  TextEditingController searchController = new TextEditingController();
  List<String> originList = [
    "BucketBag",
    "Cross Body Backpack",
    "Mini Backpack",
    "Tote Bag",
    "Messenger Bag",
    "Shoulder Bag",
    "Minaudiere Bag",
    "Drawstring Bag",
    "Saddle Bag",
    "Quilted Bag",
    "Clutch Bag",
    "Half Moon Bag",
    "Flap Bag",
    "Bagguete Bag",
    "Sling Bag",
    "Shopper Bag",
    "Wristlet",
    "Satchel Bag",
    "Backpack",
    "Canteen Bag",
    "Waist Bag",
    "Envelope Bag",
    "Structured Bag",
    "Trapezoid Bag",
    "Kelly Bag",
  ];
  List<String> filteredList;
  String keyword;

  @override
  void initState() {
    super.initState();
    originList.sort();
    // ignore: deprecated_member_use
    filteredList = new List<String>();
    keyword = '';
  }

  @override
  Widget build(BuildContext context) {
    searchController.addListener(() {
      setState(() {
        keyword = searchController.text;
      });
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
            SizedBox(
              height: 10,
            ),
            (keyword.isEmpty) ? createOriginListView() : searchData(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  searchData() {
    // ignore: deprecated_member_use
    filteredList = new List<String>();
    for (int i = 0; i < originList.length; i++) {
      var item = originList[i];
      if (item.toLowerCase().contains(keyword.toLowerCase())) {
        filteredList.add(item);
      }
    }
    return createFilteredListView();
  }

  createOriginListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: originList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                originList[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.lightBlue,
          );
        },
      ),
    );
  }

  createFilteredListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                filteredList[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.lightBlue,
          );
        },
      ),
    );
  }
}
