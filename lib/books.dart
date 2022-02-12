import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:pujapurohit/utils/epub_reader.dart';
import 'package:pujapurohit/utils/text_reader.dart';
import 'package:pujapurohit/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'localization_service.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
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
            height: 30,
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
            height: 10,
          ),
          CarouselSlider(
              items: [
                EbookCorousalTile('lib/assets/text/brahmapuran.txt', 'Raamayan'.tr, 'lib/assets/images/ram1.jpg'),
                EbookCorousalTile('lib/assets/text/padmapuran.txt', 'Mahabharat'.tr, 'lib/assets/images/maha.jfif'),
                //second container
                EbookCorousalTile('lib/assets/text/visnupuran.txt', "Katha".tr, 'lib/assets/images/katha1.png'),

                //third container
                EbookCorousalTile('lib/assets/text/sankhpuran.txt', 'Mahapuranas'.tr, 'lib/assets/images/purana.jpg'),

                //fourth container

                EbookCorousalTile('lib/assets/text/shivpuran.txt', 'Gita'.tr, 'lib/assets/images/download.jfif'),
                //fifth container
              ],
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                aspectRatio: 16 / 4,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                reverse: true,
                enableInfiniteScroll: true,
                // pageSnapping: true,
              )),
          SizedBox(
            height: 20,
          ),
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
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  //second uppuran
                  EbookListTile(
                    'lib/assets/epub/Shiva-Maha-Purana.epub',
                    'lib/assets/images/shiv.jpg',
                    "Shiv Puran",
                  ),
                  SizedBox(width: 15),
                  EbookListTile(
                    'lib/assets/epub/Brahma-Vaivart-Purana.epub',
                    'lib/assets/images/lord-brahma-vector-character.jpg',
                    "Bhrama Puran",
                  ),
                  SizedBox(width: 15),
                  EbookListTile(
                    'lib/assets/epub/Vishnu-Purana.epub',
                    'lib/assets/images/download.jfif',
                    "Visnu Puran",
                  ),
                  EbookListTile(
                    'lib/assets/epub/Garuda-Purana.epub',
                    'lib/assets/images/garuda.jpg',
                    "Garuda Puran",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
            height: 40,
          ),
          card('lib/assets/epub/Vishnu-Purana.epub', 'lib/assets/images/41846633-lord-vishnu-a-hindu-god.webp', 'Vishnu Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Padma-Purana.epub', 'lib/assets/images/padmapuran.jpeg', 'Padma Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Varaha-Purana.epub', 'lib/assets/images/Varaha.jpg', 'Varaha Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Brahmananda-Purana.epub', 'lib/assets/images/lakmi.jfif', 'Bhagavata Puran'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Matsya-Purana.epub', 'lib/assets/images/matsiya.jpg', 'Matsya'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Kurma-Purana.epub', 'lib/assets/images/kurma.jfif', 'Kurma'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Linga-Purana.epub', 'lib/assets/images/linga.jfif', 'Linga'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Shiva-Maha-Purana.epub', 'lib/assets/images/shiv.jpg', 'Shiva'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Skanda-Purana.epub', 'lib/assets/images/skanda.jfif', 'Skanda'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Agni-Purana.epub', 'lib/assets/images/agni.jfif', 'Agni'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/epub/Brahmananda-Purana.epub', 'lib/assets/images/bhrama.jpg', 'Brahmanda'),
          SizedBox(
            height: 35,
          ),
          card('lib/assets/text/shivpuran.txt', 'lib/assets/images/brahmavaivarta.jfif', 'Brahmavaivarta'),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/epub/Shiva-Maha-Purana.epub',
            'lib/assets/images/markandeya.jpg',
            'Markandeya',
          ),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/epub/Bhavishya-Purana.epub',
            'lib/assets/images/bhavishya.jfif',
            'Bhavishya',
          ),
          card(
            'lib/assets/epub/Vamana-Purana.epub',
            'lib/assets/images/vamana.jpg',
            'Vamana',
          ),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/epub/Brahma-Purana.epub',
            'lib/assets/images/bhrama.jpg',
            'Brahma',
          ),
          SizedBox(
            height: 35,
          ),
          card(
            'lib/assets/epub/Garuda-Purana.epub',
            'lib/assets/images/garuda.jpg',
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      elevation: 10.0,
      child: Container(
        width: 300.0,
        height: 300.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // This is the Custom Shape Container
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                color: Colors.red,
                child: CustomPaint(
                  painter: CustomContainerShapeBorder(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width - 8.4,
                    radius: 50.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              child: Container(
                height: 70.0,
                width: 250.0,
                child: ButtonBar(children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        EpubReaderPage(widget.textPath),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 15.0,
                    ),
                    child: Text(
                      'Read',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        EpubReaderPage(widget.textPath),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 15.0,
                    ),
                    child: Text(
                      'Add to queue',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
    // ));
  }
}

/// The {CustomContainerShapeBorder} should be reactibe with different sizes,
/// If it isn't then chamge the offset values.
class CustomContainerShapeBorder extends CustomPainter {
  final double height;
  final double width;
  final Color fillColor;
  final double radius;

  CustomContainerShapeBorder({
    this.height: 400.0,
    this.width: 300.0,
    this.fillColor: Colors.white,
    this.radius: 50.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(0.0, -radius);
    path.lineTo(0.0, -(height - radius));
    path.conicTo(0.0, -height, radius, -height, 1);
    path.lineTo(width - radius, -height);
    path.conicTo(width, -height, width, -(height + radius), 1);
    path.lineTo(width, -(height - radius));
    path.lineTo(width, -radius);

    path.conicTo(width, 0.0, width - radius, 0.0, 1);
    path.lineTo(radius, 0.0);
    path.conicTo(0.0, 0.0, 0.0, -radius, 1);
    path.close();
    canvas.drawPath(path, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
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
        Get.to(TextReader(textPath));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
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
                  style: TextStyle(color: Colors.blueGrey[800], fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40))),
        ],
      ),
    );
  }
}

class EbookListTile extends StatelessWidget {
  @override
  String textPath;
  String imagePath;
  String title;
  EbookListTile(this.textPath, this.imagePath, this.title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(EpubReaderPage(textPath));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Container(
          //   width: 180,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //     image: DecorationImage(
          //       image: AssetImage(imagePath),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Container(
          //     child: Text(title,
          //         style: TextStyle(
          //             color: Colors.blueGrey[800],
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 30))
          //           ),

          Column(
            children: [
              Container(
                  height: 80.0,
                  width: 80.0,
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        width: 2.0,
                        style: BorderStyle.solid,
                        color: Colors.black38,
                      ),
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)))),
              SizedBox(
                height: 18,
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
