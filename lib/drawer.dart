import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'blocs/auth_bloc.dart';
import 'localization_service.dart';

class MyDrawer extends StatefulWidget {
  // MyDrawer({required Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? lng;

  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                accountName: Text('userFirstName'),
                accountEmail: Text('userEmail'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('userImage'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('HomePage');
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "HomePage".tr,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile".tr,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail us".tr,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.globe,
                  color: Colors.white,
                ),
                title: Row(
                  children: [
                    Text(
                      "Language".tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text("     "),
                    new DropdownButton<String>(
                      items: LocalizationService.langs.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(color: Colors.yellow),
                          ),
                        );
                      }).toList(),
                      value: this.lng,
                      underline: Container(color: Colors.transparent),
                      isExpanded: false,
                      onChanged: (newVal) {
                        setState(() {
                          this.lng = newVal;
                          LocalizationService().changeLocale(this.lng ?? 'eng');
                        });
                      },
                    ),
                  ],
                )),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Logout".tr,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
