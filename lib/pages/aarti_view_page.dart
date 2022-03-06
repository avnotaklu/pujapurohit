import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/arti_reader.dart';
import 'aarti_page_drawer.dart';
import 'arti_page.dart';

class MobileViewAartiPage extends StatelessWidget {
  var item_no = 0.obs;
  MobileViewAartiPage(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Aarti')),
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.white,
        child: ListViewDrawer(item_no),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Obx(
            () => Expanded(child: AartiDetails(item_no.value)),
          ),
        ]),
      ),
    );
  }
}

class WideScreenAartiPage extends StatelessWidget {
  var item_no = 0.obs;

  WideScreenAartiPage(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Row(children: [
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.white,
          child: ListViewDrawer(item_no ),
        ),
      ),
      const VerticalDivider(
        thickness: 0.3,
        color: Colors.black,
      ),
      Obx(
        () => Expanded(
          flex: 4,
          child: AartiDetails(item_no.value),
        ),
      ),
      const VerticalDivider(
        thickness: 0.5,
        color: Colors.black,
      ),
      Obx(
        () => Expanded(
          flex: 3,
          child: Container(child: ArtiAudioPlayer(item_no.value)),
        ),
      )
    ])));
  }
 }

 