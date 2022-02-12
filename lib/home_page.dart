// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pujapurohit/books.dart';
import 'package:pujapurohit/books.dart';
import 'package:pujapurohit/drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'localization_service.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? lng;

  @override
  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Puja Purohit".tr),
        backgroundColor: Colors.orange,
      ),
      drawer: MyDrawer(),
      body: _uiWidget(offset),
    );
  }

  Widget _uiWidget(int offset) {
    List<String> gridMembersText = ["E-books", "Magazine", "Discourse", "Arti", "Mantra", "Shlok"];

    // List<String> gridMembersPath = [
    //   "BooksPage()",
    // ];

    List<Widget> Pages = [BooksPage()];

    return Center(
      child: Column(
        children: [
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.white,
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.white),
                      child: // SizedBox.shrink() ,
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.subject),
                            Text(
                              "subject".tr,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        IconSeperator(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category),
                            Text(
                              "categories".tr,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        IconSeperator(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.umbrella),
                            Text(
                              "writer".tr,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        IconSeperator(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.language),
                            Text(
                              "language".tr,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: CarouselFull(),
                    decoration: BoxDecoration(color: Colors.orange.shade100),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
              itemBuilder: (context, index) => Container(
                child: TextButton(
                  onPressed: () {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(gridMembersPath[index])
                    Get.to(Pages[index]);
                  },
                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.orange.shade100)),
                  child: Column(
                    children: [
                      Text(
                        gridMembersText[index].tr,
                        style: TextStyle(color: Colors.black),
                      ),
                      IconTheme(data: IconThemeData(color: Colors.orange), child: Icon(Icons.circle)),
                    ],
                  ),
                ),
                height: 10,
                width: 10,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconTheme(
              data: IconThemeData(color: Colors.orange),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.star), Icon(Icons.share), Icon(Icons.chat), Icon(Icons.info)]),
            ),
          ),
        ],
      ),
    );
  }
}

class IconSeperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 2,
        ),
        Container(
          height: 20,
          width: 2,
          color: Colors.black,
        ),
        Container(
          height: 2,
        ),
      ],
    );
  }
}

class CarouselFull extends StatefulWidget {
  @override
  State<CarouselFull> createState() => _CarouselFullState();
  int offset = 0;
}

class _CarouselFullState extends State<CarouselFull> {
  @override
  final indicatorIndex = new ValueNotifier(0);
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
        valueListenable: indicatorIndex,
        builder: (context, value, child) {
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realindex) {
                  return Container(
                    child: Text((index).toString()),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  onPageChanged: ((index, reason) => {
                        print("hello ${index}"),
                        indicatorIndex.value = index,
                      }),
                ),
                // options: CarouselOptions (
                // aspectRatio: 16/9,
                // viewportFraction: 0.8,
                // initialPage: 0,
                // enableInfiniteScroll: true,
                // reverse: false,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                // onPageChanged: emptyfunc(),
                // scrollDirection: Axis.horizontal,
                // ),
                // items: [Container()],),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(),
                  ),
                  Expanded(flex: 1, child: PageIndicator(indicatorIndex)),
                ],
              )
            ],
          );
        });
  }
}

class PageIndicator extends StatefulWidget {
  final offset;
  PageIndicator(ValueNotifier<int> _offset) : offset = _offset;
  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    print("constructed");

    return AnimatedSmoothIndicator(effect: WormEffect(), activeIndex: widget.offset.value, count: 5);
  }
}
