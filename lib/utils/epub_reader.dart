import 'dart:typed_data';
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

String countriesQuery = """
query {
  country(code : "IN"){
    name
  }
}
""";

String booksQuery(name) => """
query {
  book (name:"${name}"){
    url
  }
}
""";

Future<Uint8List> _loadFromNet(String url) async {
  // Uint8List bytes = (await NetworkAssetBundle(
  //   Uri.parse("${url}"),
  // ).load("${url}"))
  //     .buffer
  //     .asUint8List();
  // return bytes;
  http.Response response = await http.get(
    //Uri.parse('${url}'),
    Uri.parse('https://firebasestorage.googleapis.com/v0/b/baduk-8a3a6.appspot.com/o/Garuda-Purana.epub?alt=media&token=3b84e91e-83e2-4c6d-9d02-aa78700fb774'),
      // Uri.parse(
      //     'https://onuploads.com/cgi-bin/dl.cgi/y3ix23dcsur7arnkkavf3sia72u6y2wuaot743kyc7k3e3sn4nlp5da/The%20Hobbit%20by%20J.R.R.%20Tolkien.epub'),
      headers: {
        "Access-Control-Allow-Origin": "*",
      });
  return response.bodyBytes;
}

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
    return Query(
        options: QueryOptions(
          document: gql(booksQuery(info.name)),
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          try {
            String bookUrl = result.data!['book']['url'];
            return GetX<EbookController>(
                init: EbookController(bookUrl),
                builder: (value) {
                  return value.bookLoaded.value
                      ? Scaffold(
                          appBar: AppBar(
                            // Show actual chapter name
                            automaticallyImplyLeading: true,
                            title: EpubActualChapter(
                              controller: value._epubController!,
                              builder: (chapterValue) => Text(
                                "hello",
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
                          body: EpubView(
                            controller: value._epubController!,
                          ),
                        )
                      : Scaffold(body: Container());
                });
          } catch (Exception) {
            return Container();
          }
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
        //document: EpubReader.readBook(_loadFromAssets(path)),
        document: EpubReader.readBook(_loadFromNet(path)),
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
