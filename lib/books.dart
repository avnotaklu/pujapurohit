import 'package:flutter/material.dart';
import 'package:pujapurohit/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'localization_service.dart';
import 'package:get/get.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  String? lng;

  @override
  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-books".tr),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: MyDrawer(),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.green, Colors.deepPurpleAccent])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mahapuranas".tr,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
                items: [
                  InkWell(
                    child: EBookCarousalTile(),
                  ),
                  EBookCarousalTile(),
                  EBookCarousalTile(),
                  EBookCarousalTile(),
                  EBookCarousalTile(),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  reverse: true,
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 40),
              child: Text(
                "Upapuranas".tr,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EBookListTile(),
                    SizedBox(width: 15),
                    EBookListTile(),
                    SizedBox(width: 20),
                    EBookListTile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EBookCarousalTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: AssetImage('lib/assets/images/Mahadev.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class EBookListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: AssetImage('lib/assets/images/radhe-krishna.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
