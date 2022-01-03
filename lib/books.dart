import 'package:flutter/material.dart';
import 'package:pujapurohit/utils/text_reader.dart';
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
                  EbookCorousalTile('lib/assets/text/brahmapuran.txt',
                      'brahmapuran', 'lib/assets/images/Mahadev.jpg'),
                  EbookCorousalTile('lib/assets/text/padmapuran.txt',
                      'padmapuran', 'lib/assets/images/Mahadev.jpg'),
                  //second container
                  EbookCorousalTile('lib/assets/text/visnupuran.txt',
                      "vishnupuran", 'lib/assets/images/Mahadev.jpg'),

                  //third container
                  EbookCorousalTile('lib/assets/text/sankhpuran.txt',
                      'sankhpuran', 'lib/assets/images/Mahadev.jpg'),

                  //fourth container

                  EbookCorousalTile('lib/assets/text/shivpuran.txt',
                      'shivpuran', 'lib/assets/images/Mahadev.jpg'),
                  //fifth container
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
                    SizedBox(width: 15),
                    //second uppuran
                    EbookListTile('lib/assets/text/shivpuran.txt',
                        'lib/assets/images/radhe-krishna.jpg'),
                    SizedBox(width: 20),
                    EbookListTile('lib/assets/text/shivpuran.txt',
                        'lib/assets/images/radhe-krishna.jpg'),
                    SizedBox(width: 20),
                    EbookListTile('lib/assets/text/shivpuran.txt',
                        'lib/assets/images/radhe-krishna.jpg'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                "Mahapuranas".tr,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
               GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                // Generate 100 widgets that display their index in the List.
                children: List.generate(
                  8,
                  (index) {
                         return EbookListTile('lib/assets/text/shivpuran.txt',
                            'lib/assets/images/radhe-krishna.jpg');
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EbookCorousalTile extends StatelessWidget {
  @override
  String textPath;
  String bookTitle;
  String imagePath;
  EbookCorousalTile(this.textPath, this.bookTitle, this.imagePath);
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TextReader(textPath),
          ),
        );
      },
      child: Column(
      children : [ 
      // Expanded(flex : 1, child: Text(bookTitle, style: TextStyle(color : Colors.white,))),
      Expanded(
        flex: 9,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
        Expanded(flex : 1, child: Text(bookTitle, style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold,fontSize: 16))),
      ],
      ),
    );
  }
}

class EbookListTile extends StatelessWidget {
  @override
  String textPath;
  // String bookTitle;
  String imagePath;
  EbookListTile(this.textPath, this.imagePath);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TextReader(textPath)),
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
