import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:

          Center(

            child: Image(
              image: AssetImage('lib/assest/image/UI.jpg'),
              fit: BoxFit.cover,
                height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        );

  }
}