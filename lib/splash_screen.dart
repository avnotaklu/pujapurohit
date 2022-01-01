import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
          child: Image(
            image: AssetImage('lib/assest/image/UI.jpg'),
            fit: BoxFit.cover,
              height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        )
      );
  }
}