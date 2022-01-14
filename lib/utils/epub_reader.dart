

import 'dart:typed_data';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load(assetName);
  return bytes.buffer.asUint8List();
}

class EpubReaderPage extends StatefulWidget {
  @override
  State<EpubReaderPage> createState() => _EpubReaderPageState();
  EpubController? _epubController;
  String path;
  EpubReaderPage(this.path);
}

class _EpubReaderPageState extends State<EpubReaderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Show actual chapter name
        title: EpubActualChapter(
          controller: widget._epubController!,
          builder: (chapterValue) => Text(
            'Chapter ${chapterValue?.chapter?.Title ?? ''}',
            textAlign: TextAlign.start,
          ),
        ),
      ),
      // Show table of contents
      drawer: Drawer(
        child: EpubReaderTableOfContents(
          controller: widget._epubController!,
        ),
      ),
      // Show epub document
      body: EpubView(
        controller: widget._epubController!,
      ),
    );
  }

  @override
  void initState() {
    widget._epubController = EpubController(
      // Load document
      document: EpubReader.readBook(_loadFromAssets(widget.path)),
      // Set start point
      // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
    super.initState();
  }
}