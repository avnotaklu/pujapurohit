import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/backgroundimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      color: Colors.yellowAccent,
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
                      'Raamayan'.tr, 'lib/assets/images/Ramayaan.jpg'),
                  EbookCorousalTile('lib/assets/text/padmapuran.txt',
                      'Mahabharat'.tr, 'lib/assets/images/mahabharat.jpg'),
                  //second container
                  EbookCorousalTile('lib/assets/text/visnupuran.txt',
                      "Katha".tr, 'lib/assets/images/katha.png'),

                  //third container
                  EbookCorousalTile('lib/assets/text/sankhpuran.txt',
                      'Mahapuranas'.tr, 'lib/assets/images/Mahapuran.jpg'),

                  //fourth container

                  EbookCorousalTile('lib/assets/text/shivpuran.txt', 'Gita'.tr,
                      'lib/assets/images/Gita.jpg'),
                  //fifth container
                ],
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  reverse: true,
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
                    color: Colors.yellowAccent,
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
                      'lib/assets/images/shiv mahapuran.jfif',
                      "Shiv Puran",
                    ),
                    SizedBox(width: 15),
                    EbookListTile(
                      'lib/assets/text/shivpuran.txt',
                      'lib/assets/images/bhramapuran.jfif',
                      "Bhrama Puran",
                    ),
                    SizedBox(width: 15),
                    EbookListTile(
                      'lib/assets/text/shivpuran.txt',
                      'lib/assets/images/vishnu-puran.jpg',
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
                    color: Colors.yellowAccent,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            card('lib/assets/text/shivpuran.txt',
                'https://i.pinimg.com/originals/90/71/d9/9071d9b1f71c161ad7e5752136523d98.jpg', 'Vishnu Puran'),
            card('lib/assets/text/shivpuran.txt',
                'https://spiderimg.amarujala.com/assets/images/2014/06/19/vishnu-53a29e215fe6c_exlst.jpg', 'Padma Puran'),
            card('lib/assets/text/shivpuran.txt',
                'https://i.pinimg.com/originals/90/71/d9/9071d9b1f71c161ad7e5752136523d98.jpg', 'Varaha Puran'),
            card('lib/assets/text/shivpuran.txt',
                'https://1.bp.blogspot.com/-MYe6MRB1tyM/X98BxditwcI/AAAAAAAAFJ0/AtGOPLSTi-crFMF-NQxM07zKc_r0vnQewCLcBGAsYHQ/s800/37-379038_god-krishna-hd-wallpaper-shree-krishna.jpg', 'Bhagavata Puran'),
            card('lib/assets/text/shivpuran.txt','https://www.astroved.com/astropedia/assets/images/goddess/gd-matsya.jpg','Matsya'),
            card('lib/assets/text/shivpuran.txt','https://cdnb.artstation.com/p/assets/images/images/039/588/631/large/jegarupan-vathumalai-koorma-avatar-jega210307-29-final-111.jpg?1626339600','Kurma'),
            card('lib/assets/text/shivpuran.txt','https://previews.123rf.com/images/reddees/reddees2102/reddees210200104/163941823-close-up-view-of-shiva-linga-symbol-of-hindu-god-shiva.jpg','Linga'),
            card('lib/assets/text/shivpuran.txt','https://www.thugil.com/pub/media/catalog/product/cache/e803c1b4714a8f5bf8d014633abc652b/f/r/frm002.jpg','Shiva'),
            card('lib/assets/text/shivpuran.txt','https://static.india.com/wp-content/uploads/2019/02/Lord-Kartikeya.jpg','Skanda'),
            card('lib/assets/text/shivpuran.txt','https://pragyata.com/wp-content/uploads/2016/07/Agni-The-fire-within.jpg','Agni'),
            card('lib/assets/text/shivpuran.txt','https://www.behindwoods.com/tamil-movies/brahmanda-nayagan/stills-photos-pictures/brahmanda-nayagan-stills-photos-pictures-34.jpg','Brahmanda'),
            card('lib/assets/text/shivpuran.txt','https://images.news18.com/ibnkhabar/uploads/2020/07/k3-2.jpg','Brahmavaivarta'),
            card('lib/assets/text/shivpuran.txt', 'https://i0.wp.com/glorioushinduism.com/wp-content/uploads/2016/12/brahma.jpg?resize=205%2C296&ssl=1', 'Markandeya',),
             card('lib/assets/text/shivpuran.txt', 'https://wegarhwali.com/wp-content/uploads/2020/08/IMG_20200831_205043.jpg', 'Bhavishya',),
              card('lib/assets/text/shivpuran.txt', 'https://bharatdiscovery.org/bharatkosh/w/images/3/30/Vamana-Avtar.jpg', 'Vamana',),
               card('lib/assets/text/shivpuran.txt', 'https://i0.wp.com/glorioushinduism.com/wp-content/uploads/2016/12/brahma.jpg?resize=205%2C296&ssl=1', 'Brahma',),
            
          ],
        ),
      ),
    );
  }
}

//here 2
class card extends StatelessWidget {
  @override
  late String textPath;
  late String imagePath;
  late String names;
  card(this.textPath, this.imagePath, this.names);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TextReader(textPath),
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: NetworkImage(imagePath),
                    ),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          names.tr,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
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
                      color: Colors.white,
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
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
        ],
      ),
    );
  }
}
