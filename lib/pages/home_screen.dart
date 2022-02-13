import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/models/book.dart';
import 'package:pujapurohit/models/samples.dart';
import 'package:pujapurohit/pages/drawer_screen.dart';
import 'package:pujapurohit/responsive.dart';

import 'books_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            decoration: isDrawerOpen
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  )
                : BoxDecoration(color: Colors.white),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
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
                          isDrawerOpen
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      isDrawerOpen = false;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_back_ios),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 230;
                                      yOffset = 150;
                                      scaleFactor = 0.6;
                                      isDrawerOpen = true;
                                    });
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          SearchBar(),
                          ArtiSection(),
                          SizedBox(
                            height: 30.0,
                          ),
                          BooksSection(),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BooksSection extends StatelessWidget {
  const BooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 1 : 2, childAspectRatio: 1.8),
      physics: ScrollPhysics(),
      itemCount: books.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(BookDetails(info: books[index]));
          },
          child: Container(
            height: 230,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BookCard(books[index], index),
          ),
        );
      },
    );
  }
}

class BookCard extends StatelessWidget {
  int index;

  BookInfo info;

  BookCard(this.info, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: (index % 2 == 0) ? Colors.blueGrey[200] : Colors.orangeAccent[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: shadowList,
                ),
                margin: EdgeInsets.only(top: 40),
              ),
              Align(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(tag: 'pet${info.id}', child: Image.asset(info.imagePath)),
              )),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 65, bottom: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
              boxShadow: shadowList,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      info.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
                Text(
                  info.writer,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  info.likedBy + ' Active Readers'.tr,
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
                    Text(
                      'Read'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 102, 179, 105),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ArtiSection extends StatelessWidget {
  const ArtiSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: artis.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: shadowList,
                    ),
                    child: Image(
                      image: AssetImage(artis[index].imagePath),
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    artis[index].name,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            );
          }),
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
