import 'dart:typed_data';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:graphql/client.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pujapurohit/models/book.dart';
import 'package:pujapurohit/models/samples.dart';
import 'package:http/http.dart' as http;

GlobalKey ebookKey = GlobalKey();

String countriesQuery = """
query {
  country(code : "IN"){
    name
  }
}
""";

String booksQuery(name, lang) => """
query {
  bookInLang (name:"${name}", lang: "${lang}"){
    url
  }
}
""";

Future<Uint8List> _loadFromNet(String url) async {
  http.Response response = await http.get(
    Uri.parse(url),
  );
  return response.bodyBytes;
}

Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load("lib/assets/epub/hindi/Brahma-Purana.epub");
  return bytes.buffer.asUint8List();
}

class EpubReaderPage extends StatelessWidget {
  BookInfo info;
  RxBool isFavorite = false.obs;

  String lang;
  Rx<EpubController?> _epubController = Rx(null);

  var bookUrl = "".obs;

  EpubReaderPage(this.info, plang) : lang = plang;
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(booksQuery(info.name, lang)),
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          try {
            bookUrl.value = result.data?['bookInLang']['url'];
            //await Get.delete<EbookController>(tag: "EB");
            //var controller = EbookController(bookUrl.value);
            _epubController.value = EpubController(
              document: EpubReader.readBook(_loadFromNet(bookUrl.value)),
            );
            // if (controller._epubController?.value == null && controller.path != bookUrl.value) {
            //   controller.path == bookUrl.value;
            //   controller._epubController?.value = EpubController(
            //     document: EpubReader.readBook(_loadFromNet(bookUrl.value)),
            //   );
            // }

            // return GetX<EbookController>(
            //     tag: "${lang.value}",
            //     init: EbookController(bookUrl.value),
            //     builder: (controller) {
            //controller.path= bookUrl.value;

            // controller._epubController?.value = EpubController(
            //   // Load documenturlpath
            //   //document: EpubReader.readBook(_loadFromAssets(path)),
            //   document: EpubReader.readBook(_loadFromNet(bookUrl.value)),
            //   // Set start point
            //   // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
            // );

            // return FutureBuilder(
            //     future: controller._epubController!.value!.document,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            return FutureBuilder(
                future: _epubController.value!.document,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      appBar: AppBar(
                        // Show actual chapter name
                        // automaticallyImplyLeading: true,

                        title: EpubActualChapter(
                          controller: _epubController.value!,
                          builder: (chapterValue) => Text(
                            "${info.name}",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        actions: [
                          Expanded(
                            child: DropdownButton(
                              value: lang,
                              onChanged: (value) async {
                                // await Get.deleteAll(force: true);
                                // await Get.delete<EbookController>(tag: "${lang.value}", force: true);
                                
                                lang = value as String;
                                _epubController.value!.dispose();
                                Get.close(1);

                                Get.to(EpubReaderPage(info, value),routeName: "Reader-${value}");
                                //controller._epubController?.value = null;
                                // controller.bookLoaded.value = false;
                              },
                              items: [
                                DropdownMenuItem(value: "${langs[0]}", child: Text("${langs[0]}")),
                                DropdownMenuItem(value: "${langs[1]}", child: Text("${langs[1]}"))
                              ],
                            ),
                          )
                        ],
                      ),
                      // Show table of contents
                      drawer: Drawer(
                        child: EpubReaderTableOfContents(controller: _epubController.value!),
                      ),
                      // Show epub document
                      body: EpubView(controller: _epubController.value!),
                    );
                  } else {
                    return Container();
                  }
                  // });
                  // } else {
                  //   return Container();
                  // }

                  // return Obx(() {
                  // });
                });
            // });
            // });
          } catch (Exception) {
            return Container();
          }
        });
  }
}

class EbookController {
  EpubController? _epubController;
  bool bookLoaded = false;
  String path = "";
  EbookController(String ppath)
      : _epubController = EpubController(
          // Load documenturlpath
          //document: EpubReader.readBook(_loadFromAssets(path)),
          document: EpubReader.readBook(_loadFromNet(ppath)),
          // Set start point
          // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
        ) {
    path = ppath;
    bookLoaded = true;
  }

  loadBook() {
    try {
      _epubController = EpubController(
        // Load documenturlpath
        //document: EpubReader.readBook(_loadFromAssets(path)),
        document: EpubReader.readBook(_loadFromNet(path)),
        // Set start point
        // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
      );
      bookLoaded = true;
    } catch (error) {
      throw Exception("Unable to load book");
    }
  }
}

/* 
class EbookController extends GetxController {
  EpubController? _epubController;
  RxBool bookLoaded = false.obs;
  String path = "";
  EbookController(String ppath)
      : _epubController = EpubController(
          // Load documenturlpath
          //document: EpubReader.readBook(_loadFromAssets(path)),
          document: EpubReader.readBook(_loadFromNet(ppath)),
          // Set start point
          // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
        ) {
    path = ppath;
    bookLoaded.value = true;
  }

  loadBook() {
    try {
      _epubController = EpubController(
        // Load documenturlpath
        //document: EpubReader.readBook(_loadFromAssets(path)),
        document: EpubReader.readBook(_loadFromNet(path)),
        // Set start point
        // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
      );
      bookLoaded.value = true;
    } catch (error) {
      super.onInit();
      throw Exception("Unable to load book");
    }
  }

  @override
  onInit() {
    loadBook();
    super.onInit();
  }
}
*/