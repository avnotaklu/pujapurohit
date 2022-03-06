import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:pujapurohit/models/samples.dart';
import 'package:pujapurohit/pages/aarti_view_page.dart';
import '../responsive.dart';
class AartiPage extends StatelessWidget {
  var item_no = 0.obs;
   AartiPage(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveWidget.isSmallScreen(context) ? MobileViewAartiPage(item_no.value) : WideScreenAartiPage(item_no.value),
    );
  }
}
class AartiDetails extends StatelessWidget {
  int item_no;
  AartiDetails(this.item_no);
  var style = MarkdownStyleSheet(
    textAlign: WrapAlignment.center,
    h1Align: WrapAlignment.center,
    h1: const TextStyle(color: Colors.orangeAccent, fontSize: 28),
    textScaleFactor: 1.5,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: rootBundle.loadString(artis[item_no].textPath),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data!,
                  styleSheet: style,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
