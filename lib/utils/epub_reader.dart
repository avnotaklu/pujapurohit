import 'dart:typed_data';

import 'package:epub_view/epub_view.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load(assetName);
  return bytes.buffer.asUint8List();
}

class EpubReaderPage extends StatelessWidget {
  final String path;

  EpubReaderPage(this.path);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<EbookController>(
        init: EbookController(path),
        builder: (value) {
          return value.bookLoaded.value
              ? Scaffold(
                  appBar: AppBar(
                    // Show actual chapter name
                    automaticallyImplyLeading: true,
                    title: EpubActualChapter(
                      controller: value._epubController!,
                      builder: (chapterValue) => Text(
                        '${path.split('/').last.split(".")[0].replaceAll(RegExp("\}"), "").replaceAll(RegExp("\-"), " ")}',
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