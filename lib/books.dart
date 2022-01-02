import 'package:flutter/material.dart';
import 'package:pujapurohit/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'Mahapurans/Bhamha Puran.dart';
import 'Mahapurans/padmapuran.dart';
import 'Mahapurans/sankhpuran.dart';
import 'Mahapurans/shivpuran.dart';
import 'Mahapurans/visnupuran.dart';
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
            CarouselSlider(items: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BrahmaPuran()),
                  );
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: AssetImage('lib/assets/images/Mahadev.jpg'),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              ),

              //second container

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PadmaPuran()),
                  );
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: AssetImage('lib/assets/images/Mahadev.jpg'),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              ),

              //third container

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const visnupuran()),
                  );
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: AssetImage('lib/assets/images/Mahadev.jpg'),
                      fit: BoxFit.cover,

                    ),

                  ),
                ),
              ),

              //fourth container

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const sknda()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: AssetImage('lib/assets/images/Mahadev.jpg'),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              ),

              //fifth container

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const shiv()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: AssetImage('lib/assets/images/Mahadev.jpg'),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              )

            ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  reverse: true,
                )
            ),
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const shiv()),
                        );
                      },
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image:
                            AssetImage('lib/assets/images/radhe-krishna.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:15),
                    //second uppuran

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const shiv()),
                        );
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image:
                            AssetImage('lib/assets/images/radhe-krishna.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:20),
                    //third uppuran
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const shiv()),
                        );
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image:
                            AssetImage('lib/assets/images/radhe-krishna.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:  Text(
                "Mahapuranas".tr,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
            SizedBox(height: 25,),

            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              // Generate 100 widgets that display their index in the List.
              children: List.generate(8, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const shiv()),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image:
                        AssetImage('lib/assets/images/radhe-krishna.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),


                  ),
                );

              },
              ),
            ),


          ],
        ),
      ),
    );
  }
}