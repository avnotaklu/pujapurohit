import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pujapurohit/pages/home_screen.dart';
import 'package:pujapurohit/splash_screen.dart';
import 'package:pujapurohit/utils/epub_reader.dart';

import 'localization_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:graphql/client.dart';

Future<Box> openHiveBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) Hive.init((await getApplicationDocumentsDirectory()).path);

  return await Hive.openBox(boxName);
}

getClient(httpLink) async {
  Directory appDocDirectory;
  if (!kIsWeb) {
    appDocDirectory = await getApplicationDocumentsDirectory();
  } else {
    appDocDirectory = Directory(".");
  }

  /// initialize Hive and wrap the default box in a HiveStore
  final store = await HiveStore.open(path: appDocDirectory.path);
  return store;
}

void main() async {
  // if (kIsWeb) {
  //   var envVars = await dotenv.load(fileName: ".release.env");
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: dotenv.env['APIKEY']!,
  //         appId: dotenv.env['APPID']!,
  //         messagingSenderId: dotenv.env['MESSAGINGSENDERID']!,
  //         projectId: dotenv.env['PROJECTID']!),
  //   );
  // } else {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  // }
  await GetStorage.init();

  HttpLink httpLink;
  if (kIsWeb) {
    httpLink = HttpLink(
        //'https://puja-purohit-books.herokuapp.com/graphql',
        'http://localhost:8080/graphql',
        defaultHeaders: {
          "Accept": "application/json",
        });
  } else {
    httpLink = HttpLink(
      // 'https://puja-purohit-books.herokuapp.com/graphql',
        'http:/192.168.43.25:8080/graphql',
      defaultHeaders: {
        "Access-Control-Allow-Headers": "*",
        "Accept": "application/json",
      },
    );
  }
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: await getClient(httpLink)),
    ),
  );

  runApp(MyApp(client));
  // var imageUrl = "";
  // var response = await http.get(Uri.parse(imageUrl));
  // //final documentDirectory = await getApplicationDocumentsDirectory();
  // final documentDirectory = Directory("lib/");

  // String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  // File file = File(path.join(documentDirectory.path, 'newestfile.epub'));
  // file.writeAsBytes(response.bodyBytes);

  // final file = await getFileFromNetworkImage();

  // runApp(MaterialApp(
  //   home: Scaffold(
  //     body: Container(
  //       child: ColorFiltered(
  //         colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.modulate),
  //         child: Image.asset(
  //           "lib/assets/images/bookTemplate.png",
  //           //"lib/assets/images/place_holder/cat.png",
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //     ),
  //   ),
  // ));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp(this.client);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: GetMaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),

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
        ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
