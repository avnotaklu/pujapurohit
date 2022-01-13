import 'dart:typed_data';

import 'package:epub_view/epub_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
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
    lng = LocalizationService().getCurrentLang();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "PopularBooks".tr,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CarouselSlider(
              items: [
                EbookCorousalTile('lib/assets/text/brahmapuran.txt',
                    'Raamayan'.tr, 'lib/assets/images/Ramayaan1.jpg'),
                EbookCorousalTile('lib/assets/text/padmapuran.txt',
                    'Mahabharat'.tr, 'lib/assets/images/Mahabharat1.jpg'),
                //second container
                EbookCorousalTile('lib/assets/text/visnupuran.txt', "Katha".tr,
                    'lib/assets/images/katha1.png'),

                //third container
                EbookCorousalTile('lib/assets/text/sankhpuran.txt',
                    'Mahapuranas'.tr, 'lib/assets/images/purana.jpg'),

                //fourth container

                EbookCorousalTile('lib/assets/text/shivpuran.txt', 'Gita'.tr,
                    'lib/assets/images/Gita1.jpg'),
                //fifth container
              ],
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                reverse: true,
                enableInfiniteScroll: true,
                // pageSnapping: true,
              )),
          Padding(
            padding: EdgeInsets.only(left: 0, top: 20, bottom: 20),
            child: Center(
              child: Text(
                "Famous Mahapurans".tr,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 15),
                  //second uppuran
                  EbookListTile(
                    'lib/assets/text/shivpuran.txt',
                    'lib/assets/images/mahadev.jpg',
                    "Shiv Puran",
                  ),
                  SizedBox(width: 15),
                  EbookListTile(
                    'lib/assets/text/shivpuran.txt',
                    'lib/assets/images/bhrama.jpg',
                    "Bhrama Puran",
                  ),
                  SizedBox(width: 15),
                  EbookListTileEPub(
                    'lib/assets/text/shivpuran.txt',
                    'lib/assets/images/visnu_2.jpg',
                    "Visnu Puran",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Center(
              child: Text(
                "Mahapuranas".tr,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/visnu_2.jpg',
              'Vishnu Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt',
              'lib/assets/images/padmapuran.jpeg', 'Padma Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/Varaha.jpg',
              'Varaha Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt',
              'lib/assets/images/Bhagavata.jpg', 'Bhagavata Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/Matsya.png',
              'Matsya'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/kurma.png',
              'Kurma'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/linga.jpg',
              'Linga'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/shiva.jfif',
              'Shiva'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/skanda.jfif',
              'Skanda'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/agni.jfif',
              'Agni'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/bhrama.jpg',
              'Brahmanda'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt',
              'lib/assets/images/brahmavaivarta.jfif', 'Brahmavaivarta'),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/text/shivpuran.txt',
            'lib/assets/images/markandeya.jpg',
            'Markandeya',
          ),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/text/shivpuran.txt',
            'lib/assets/images/bhavishya.jfif',
            'Bhavishya',
          ),
          card(
            'lib/assets/text/shivpuran.txt',
            'lib/assets/images/vamana.jpg',
            'Vamana',
          ),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/text/shivpuran.txt',
            'lib/assets/images/bhrama.jpg',
            'Brahma',
          ),
        ],
      ),
    );
  }
}

//here 2
class card extends StatefulWidget {
  @override
  late String textPath;
  late String imagePath;
  late String names;
  card(this.textPath, this.imagePath, this.names);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              // title: Text(widget.names),
              subtitle: Text(
                widget.names,
                style: TextStyle(fontSize: 30),
              ),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              height: 300.0,
              child: Ink.image(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Aum Sarvebhyo Devebhyo Namaha....",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Read'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TextReader(widget.textPath),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: const Text('Add to favourite'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ));
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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Expanded(flex : 1, child: Text(bookTitle, style: TextStyle(color : Colors.white,))),

          Container(
            // height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
              child: Text(bookTitle,
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40))),
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
  String title;
  EbookListTile(this.textPath, this.imagePath, this.title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TextReader(textPath)),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
        ],
      ),
    );
  }
}

Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load(assetName);
  return bytes.buffer.asUint8List();
}

class EbookListTileEPub extends StatelessWidget {
  @override
  String textPath;
  // String bookTitle;
  String imagePath;
  String title;
  EpubController? _epubController;

  EbookListTileEPub(this.textPath, this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EpubReaderPage("lib/assets/text/book.epub")));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
        ],
      ),
    );
  }
}

class EpubReaderPage extends StatefulWidget {
  @override
  State<EpubReaderPage> createState() => _EpubReaderPageState();
  EpubController? _epubController;
  String path;
  EpubReaderPage(this.path);
}

class _EpubReaderPageState extends State<EpubReaderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Show actual chapter name
        title: EpubActualChapter(
          controller: widget._epubController!,
          builder: (chapterValue) => Text(
            'Chapter ${chapterValue?.chapter?.Title ?? ''}',
            textAlign: TextAlign.start,
          ),
        ),
      ),
      // Show table of contents
      drawer: Drawer(
        child: EpubReaderTableOfContents(
          controller: widget._epubController!,
        ),
      ),
      // Show epub document
      body: EpubView(
        controller: widget._epubController!,
      ),
    );
  }

  @override
  void initState() {
    widget._epubController = EpubController(
      // Load document
      document: EpubReader.readBook(_loadFromAssets(widget.path)),
      // Set start point
      // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
    super.initState();
  }
}
