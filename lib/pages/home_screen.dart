import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/localization_service.dart';
import 'package:pujapurohit/models/book.dart';
import 'package:pujapurohit/models/samples.dart';
import 'package:pujapurohit/pages/drawer_screen.dart';
import 'package:pujapurohit/responsive.dart';

import 'books_details.dart';

var colors = [
  // Colors.cyan,
  // Colors.lightGreen.shade400

  //"0xFFF59237",
  //"0xFFF5B56F",

  "0xFF5FB2AF",
  "0xFFF5CD59",
  "0xFFF5A034",
  "0xFF354A5C",
];

class HomeScreen extends StatelessWidget {
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  RxDouble scaleFactor = 1.0.obs;

  RxBool isDrawerOpen = false.obs;
  RxString lng = "".obs;

  @override
  Widget build(BuildContext context) {
    lng.value = LocalizationService().getCurrentLang();

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            //DrawerScreen(),
            AnimatedContainer(
              decoration: isDrawerOpen.value
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    )
                  : BoxDecoration(color: Colors.white),
              transform: Matrix4.translationValues(xOffset.value, yOffset.value, 0)..scale(scaleFactor.value),
              duration: Duration(milliseconds: 250),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isDrawerOpen.value
                                ? IconButton(
                                    onPressed: () {
                                      xOffset.value = 0;
                                      yOffset.value = 0;
                                      scaleFactor.value = 1;
                                      isDrawerOpen.value = false;
                                    },
                                    icon: Icon(Icons.arrow_back_ios),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      xOffset.value = 230;
                                      yOffset.value = 150;
                                      scaleFactor.value = 0.6;
                                      isDrawerOpen.value = true;
                                    },
                                    icon: Icon(Icons.menu),
                                  ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.book_sharp,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    'Puja, ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Purohit'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('lib/assets/images/place_holder/Lucifer.jpeg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Expanded(
                            flex: ResponsiveWidget.isSmallScreen(context)
                                ? 30
                                : ResponsiveWidget.isMediumScreen(context)
                                    ? 20
                                    : 7,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  SearchBar(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Artis".tr,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'Poly',
                                        ),
                                        textAlign: TextAlign.left,
                                        maxFontSize: 40,
                                        minFontSize: 30,
                                      ),
                                    ),
                                  ),
                                  ArtiSection(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Popular Books".tr,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'Poly',
                                        ),
                                        textAlign: TextAlign.left,
                                        maxFontSize: 40,
                                        minFontSize: 30,
                                      ),
                                    ),
                                  ),
                                  BooksSection(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class BooksSection extends StatelessWidget {
  const BooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.isSmallScreen(context)
            ? 1
            : ResponsiveWidget.isMediumScreen(context)
                ? 4
                : 6,
        childAspectRatio: ResponsiveWidget.isSmallScreen(context) ? 2.5 : 0.52,
        // crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      physics: ScrollPhysics(),
      itemCount: books.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        print(colors[0].toString());
        print(colors[1].toString());
        // print(Color(int.parse(colors[1].toString())).toString());
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(BookDetails(info: books[index]));
            },
            child: BookCard(books[index], index, Color(int.parse(colors[index % 4])), Colors.lightGreen.shade100),
            // ? BookCard(books[index], index, colors[0], Colors.lightGreen.shade100)
            // : BookCard(books[index], index, colors[1], Colors.lightGreen.shade100),
          ),
        );
      },
    );
  }
}

class BookCard extends StatelessWidget {
  int index;

  BookInfo info;

  final Color topColor;
  final Color textColor;

  BookCard(this.info, this.index, this.topColor, this.textColor);

  returnChildren(context) {
    return [
      Expanded(
        flex: ResponsiveWidget.isSmallScreen(context) ? 5 : 30,
        child: BookTemplate(topColor, info, textColor),
      ),
      Expanded(
        flex: 10,
        child: Container(
          padding: ResponsiveWidget.isSmallScreen(context) ? EdgeInsets.all(20) : EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                info.name.tr,
                wrapWords: true,
                minFontSize: 15,
                maxFontSize: 20,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              AutoSizeText(
                info.writer.tr,
                minFontSize: 13,
                maxFontSize: 16,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),
              AutoSizeText(
                info.likedBy + ' Active Readers'.tr,
                minFontSize: 12,
                maxFontSize: 14,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book,
                    color: primaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  AutoSizeText(
                    'Read'.tr,
                    minFontSize: 12,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 179, 105),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //boxShadow: shadowList,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: returnChildren(context),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: returnChildren(context),
            ),
    );
  }
}

class BookTemplate extends StatelessWidget {
  final Color topColor;
  BookInfo info;

  final Color textColor;

  BookTemplate(this.topColor, this.info, this.textColor);
  Widget build(BuildContext context) {
    return Container(
      color: ResponsiveWidget.isSmallScreen(context) ? topColor : Colors.white,
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(topColor, BlendMode.modulate),
            child: Image.asset(
              "lib/assets/images/bookTemplate350x500.png",
              //"lib/assets/images/place_holder/cat.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  child: Hero(
                      tag: 'pet${info.id}',
                      child: Image.asset(
                        info.imagePath,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 128, left: 20, right: 20),
              child: AutoSizeText(
                "${info.name}",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                  fontFamily: 'Hanuman',
                ),
                textAlign: TextAlign.center,
                maxFontSize: 25,
                minFontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  Expanded(
//   flex: 2,
//   child: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [Colors.grey.shade600, Colors.grey.shade500],
//       ),
//     ),
//   ),

class ArtiSection extends StatelessWidget {
  const ArtiSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color : Color(0xFFFFF3E2),
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: artis.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ArtiCard(Color(int.parse(colors[index % 4])), Colors.lightGreen.shade100, artis[index].name.tr, artis[index].imagePath),
                // ArtiCard(index % 2 == 0 ? colors[0] : colors[1], Colors.lightGreen.shade100, artis[index].name.tr, artis[index].imagePath),
              );
            }),
      ),
    );
  }
}

class ArtiCard extends StatelessWidget {
  final String name;
  final String path;
  final Color topColor;
  final Color textColor;

  ArtiCard(this.topColor, this.textColor, this.name, this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: topColor,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Image(
              image: AssetImage(path),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 3,
            child: AutoSizeText(
              "${name}",
              maxLines: 2,
              style: TextStyle(color: textColor, fontFamily: 'Hanuman'),
              textAlign: TextAlign.center,
              maxFontSize: 25,
              minFontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          hintText: 'Search Book'.tr,
          hintStyle: TextStyle(letterSpacing: 1, color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.tune_sharp, color: Colors.grey[400]),
        ),
      ),
    );
  }
}
