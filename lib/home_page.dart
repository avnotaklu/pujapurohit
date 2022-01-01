import 'package:flutter/material.dart';
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
        title: Text("Mythology Books"),
        backgroundColor: Colors.orange,
      ),
      drawer: MyDrawer(),
      body: _uiWidget(offset),
    );
  }

  Widget _uiWidget(int offset) {
    List<String> gridMembersText = [
      "e-books",
      "magazine",
      "discourse",
      "arti",
      "mantra",
      "shlok"
    ];

    return Center(
      child: Column(
        children: [
          // Text(
          // "hello_title".tr,
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // ),
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.white,
          ),
          Container(
            height: 240,
            child: Column(
              children: [
                Container(
                  child: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                  height: 50,
                  decoration: BoxDecoration(color: Colors.orange),
                ),
                Expanded(
                  child: Container(
                    child: CarouselFull(),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.amber),
          ),
          Container(
            height: 80,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (context, index) => Container(
              child: TextButton(
                onPressed: () => {},
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.orange.shade100)),
                child: Column(
                  children: [
                    Text(
                      gridMembersText[index].tr,
                      style: TextStyle(color: Colors.black),
                    ),
                    IconTheme(
                        data: IconThemeData(color: Colors.orange),
                        child: Icon(Icons.circle)),
                  ],
                ),
              ),
              height: 10,
              width: 10,
            ),
          ),
          Container(
            height: 50,
          ),
          IconTheme(
            data: IconThemeData(color: Colors.orange),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.share),
                  Icon(Icons.chat),
                  Icon(Icons.info)
                ]),
          ),
          Container(
            height: 20,
          )
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
                  Container(
                    height: 150,
                  ),
                  PageIndicator(indicatorIndex),
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

    return AnimatedSmoothIndicator(
        effect: WormEffect(), activeIndex: widget.offset.value, count: 5);
  }
}
