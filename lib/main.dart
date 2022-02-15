import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pujapurohit/pages/home_screen.dart';
import 'package:pujapurohit/splash_screen.dart';

import 'localization_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  if (kIsWeb) {
    var envVars = await dotenv.load(fileName: ".release.env");
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: dotenv.env['APIKEY']!,
          appId: dotenv.env['APPID']!,
          messagingSenderId: dotenv.env['MESSAGINGSENDERID']!,
          projectId: dotenv.env['PROJECTID']!),
    );
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      title: 'Flutter Multilanguage App',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(), // your translations
      locale: LocalizationService().getCurrentLocale(), // translations will be displayed in that locale
      fallbackLocale: Locale(
        'en',
        'US',
      ), // specify the fallback locale in case an invalid locale is selected.
      initialRoute: "/HomePage",
      getPages: [
        GetPage(name: '/HomePage', page: () => HomeScreen()),
        GetPage(name: '/SplashScreen', page: () => SplashScreen()),
      ],
    );
  }
}
