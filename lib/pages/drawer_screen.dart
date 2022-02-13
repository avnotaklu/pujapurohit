import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/localization_service.dart';
import 'package:pujapurohit/models/samples.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late String lng;

  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/place_holder/Lucifer.jpeg'),
              ),
              title: Text(
                'SarojKumarPadhi'.tr,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                'Active status'.tr,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                  letterSpacing: .7,
                ),
              ),
            ),
          ),
          Column(
            children: navList
                .map((e) => ListTile(
                      leading: Icon(
                        e['icon'],
                        color: Colors.grey[500],
                      ),
                      title: Text(
                        e['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          fontSize: 18.0,
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.globe,
                color: Colors.grey[500],
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Language".tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[500]),
              ),
              Text("     "),
              DropdownButton<String>(
                items: LocalizationService.langs.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  );
                }).toList(),
                value: this.lng,
                underline: Container(color: Colors.transparent),
                isExpanded: false,
                onChanged: (newVal) {
                  setState(() {
                    this.lng = newVal!;
                    LocalizationService().changeLocale(this.lng);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
