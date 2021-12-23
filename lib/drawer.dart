import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/auth_bloc.dart';
import 'localization_service.dart';

class MyDrawer extends StatefulWidget {
  // MyDrawer({required Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final imgurl = "lib/assest/image/suraj.jpeg";

  String? lng;

  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    var userFirstName;
    var userImage;
    var userEmail;

    authBloc.currentUser.listen((user) {
      if (user != null) {
        userFirstName = user.displayName;
        userImage = user.photoURL;
        userEmail = user.email;
      }
    });
    return StreamBuilder(
      stream: authBloc.currentUser,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                  accountName: Text(userFirstName),
                  accountEmail: Text(userEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(userImage),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Mail us",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
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
                        "Language",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                            LocalizationService()
                                .changeLocale(this.lng ?? 'eng');
                          });
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
