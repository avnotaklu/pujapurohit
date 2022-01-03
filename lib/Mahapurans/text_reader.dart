import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextReader extends StatefulWidget {
  const TextReader(var _textPath, {Key? key} ) : textPath = _textPath , super(key: key) ;

  final String textPath;
  @override
  _TextReaderState createState() => _TextReaderState();
}

class _TextReaderState extends State<TextReader> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: FutureBuilder<String>(
                future: rootBundle.loadString(widget.textPath),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done)
                  {
                        return Text(snapshot.data ?? "no text to be printed");
                  }
                  else
                   return Text("waiting");
                },
              )),
        ],
      ),
    );
  }
}
