import 'package:flutter/material.dart';
import 'package:pujapurohit/drawer.dart';

import 'localization_service.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? lng;

  @override
  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Mythology Books"),

        backgroundColor: Colors.orange,
      ),
      drawer: MyDrawer(),

      body: _uiWidget(),

    );
  }

  Widget _uiWidget() {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        "hello_title".tr,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),]),
    ) ;
  }
}
