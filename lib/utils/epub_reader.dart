import 'dart:convert';
import 'dart:typed_data';

import 'package:epub_viewer/epub_viewer.dart';
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
  String path;
  EpubReaderPage(this.path);
}

class _EpubReaderPageState extends State<EpubReaderPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    EpubViewer.setConfig(
      themeColor: Theme.of(context).primaryColor,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.VERTICAL,
      allowSharing: true,
      enableTts: true,
    );
    return FutureBuilder(
        future: EpubViewer.openAsset(widget.path),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
                // Show actual chapter name
                title: StreamBuilder(
                    stream: EpubViewer.locatorStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Text("${EpubLocator.fromJson(jsonDecode(snapshot.data.toString()))}");
                      }
                      return Center(
                          child: FractionallySizedBox(
                        heightFactor: 0.7,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                          ),
                        ),
                      ));
                    })),
            // Show table of contents

            // Show epub document
            body: Center(
              child: FractionallySizedBox(
                widthFactor: 0.4,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
