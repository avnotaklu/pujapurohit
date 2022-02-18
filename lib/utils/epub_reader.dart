import 'dart:typed_data';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import 'package:pujapurohit/models/book.dart';
import 'package:pujapurohit/models/samples.dart';

Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load(assetName);
  return bytes.buffer.asUint8List();
}

class EpubReaderPage extends StatelessWidget {
  BookInfo info;
  RxBool isFavorite = false.obs;

  EpubReaderPage(this.info);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<EbookController>(
        init: EbookController(info.bookPath),
        builder: (value) {
          return value.bookLoaded.value
              ? Scaffold(
                  appBar: AppBar(
                    // Show actual chapter name
                    automaticallyImplyLeading: true,
                    title: EpubActualChapter(
                      controller: value._epubController!,
                      builder: (chapterValue) => Text(
                        '${info.bookPath.split('/').last.split(".")[0].replaceAll(RegExp("\}"), "").replaceAll(RegExp("\-"), " ")}',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // Show table of contents
                  drawer: Drawer(
                    child: EpubReaderTableOfContents(
                      controller: value._epubController!,
                    ),
                  ),
                  // Show epub document
                  body: CustomScrollView(
                    slivers: [
                    // SliverFillRemaining(
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Stack(children: [
                    //       Positioned.fill(
                    //         child: Column(
                    //           children: [
                    //             Expanded(
                    //               child: Container(
                    //                 color: (info.id % 2 == 0) ? Colors.blueGrey[200] : Colors.orangeAccent[200],
                    //                 child: Align(
                    //                   alignment: Alignment.center,
                    //                   child: Hero(
                    //                     tag: 'pet${info.id}',
                    //                     child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(info.imagePath)))),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Container(
                    //                 color: Colors.white,
                    //                 child: Container(
                    //                   margin: EdgeInsets.fromLTRB(10, 80, 10, 120),
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.start,
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     children: [
                    //                       Row(
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                    //                         children: [
                    //                           Expanded(
                    //                             child: ListTile(
                    //                               leading: CircleAvatar(
                    //                                 backgroundImage: AssetImage('lib/assets/images/place_holder/Lucifer.jpeg'),
                    //                               ),
                    //                               title: Text(
                    //                                 'SarojKumarPadhi'.tr,
                    //                                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                    //                               ),
                    //                               subtitle: Text(
                    //                                 'Please share if to appriciate us'.tr,
                    //                                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400]),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             'May 25, 2019',
                    //                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400]),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(top: 30),
                    //         child: Align(
                    //           alignment: Alignment.topCenter,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               IconButton(
                    //                 onPressed: () {
                    //                   Navigator.pop(context);
                    //                 },
                    //                 icon: Icon(
                    //                   Icons.arrow_back_ios_rounded,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //               IconButton(
                    //                 onPressed: () {
                    //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //                     content: Text("Sharing Book File"),
                    //                   ));
                    //                 },
                    //                 icon: Icon(
                    //                   Icons.ios_share,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.center,
                    //         child: Container(
                    //           height: 140,
                    //           margin: EdgeInsets.symmetric(horizontal: 20),
                    //           decoration: BoxDecoration(
                    //             boxShadow: shadowList,
                    //             borderRadius: BorderRadius.circular(20),
                    //             color: Colors.white,
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(20.0),
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //               children: [
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Text(
                    //                       info.name,
                    //                       style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         fontSize: 21.0,
                    //                         color: Colors.grey[600],
                    //                       ),
                    //                     ),
                    //                     Icon(
                    //                       Icons.share,
                    //                       color: Colors.grey[500],
                    //                       size: 30,
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Text(
                    //                       info.writer,
                    //                       style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.grey[500],
                    //                         letterSpacing: 0.7,
                    //                       ),
                    //                     ),
                    //                     Text(
                    //                       info.likedBy + ' Active Readers'.tr,
                    //                       style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.grey[500],
                    //                         letterSpacing: 0.7,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(height: 2),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   children: [
                    //                     Icon(
                    //                       Icons.book,
                    //                       color: primaryColor,
                    //                       size: 18,
                    //                     ),
                    //                     SizedBox(
                    //                       width: 3,
                    //                     ),
                    //                     Text(
                    //                       info.likedBy + ' Active Readers'.tr,
                    //                       style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.grey[400],
                    //                         letterSpacing: 0.8,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.bottomCenter,
                    //         child: Container(
                    //           height: 120,
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey[200],
                    //             borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 25),
                    //             child: Row(
                    //               children: [
                    //                 GestureDetector(
                    //                   onTap: () {
                    //                     if (isFavorite.value) {
                    //                       isFavorite.value = false;
                    //                     } else {
                    //                       isFavorite.value = true;
                    //                     }
                    //                   },
                    //                   child: Container(
                    //                     height: 50,
                    //                     width: 50,
                    //                     child: Obx(() {
                    //                       return isFavorite.value
                    //                           ? Icon(
                    //                               Icons.favorite_rounded,
                    //                               color: Colors.redAccent,
                    //                             )
                    //                           : Icon(
                    //                               Icons.favorite_border_rounded,
                    //                               color: Colors.white,
                    //                             );
                    //                     }),
                    //                     decoration: BoxDecoration(
                    //                       color: primaryColor,
                    //                       borderRadius: BorderRadius.circular(10),
                    //                       boxShadow: shadowList,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 30,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ]),
                    //   ),
                    // ),
                    SliverFillRemaining(
                      child: Expanded(
                        child: EpubView(
                          controller: value._epubController!,
                        ),
                      ),
                      hasScrollBody: true,
                    ),
                  ]),
                )
              : Scaffold(body: Container());
        });
  }
}

class EbookController extends GetxController {
  EpubController? _epubController;
  RxBool bookLoaded = false.obs;
  String path;
  EbookController(this.path);

  @override
  void onInit() {
    try {
      _epubController = EpubController(
        // Load document
        document: EpubReader.readBook(_loadFromAssets(path)),
        // Set start point
        // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
      );
      bookLoaded.value = true;
    } catch (error) {
      throw Exception("Unable to load book");
    }
    super.onInit();
  }
}
