import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/models/arti.dart';
import 'package:pujapurohit/models/book.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [BoxShadow(color: (Colors.orange[400])!, blurRadius: 10, spreadRadius: 0.2, offset: Offset(2, 2))];

List<Map> navList = [
{'icon': Icons.phone, 'title': 'Social Media'},
{'icon': Icons.markunread_mailbox_rounded, 'title': 'Donation'},
{'icon': Icons.add_rounded, 'title': 'Add books'},
{'icon': Icons.favorite_rounded, 'title': 'Favorites'},
{'icon': Icons.mail_rounded, 'title': 'Messages'},
{'icon': Icons.person, 'title': 'Profile'},
];

List<BookInfo> books = [
  BookInfo(
      0,
      'Ramayaan',
      'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
      'Valmiki',
      '250',
      ),
  BookInfo(1, 'Mahabharat', 'lib/assets/images/place_holder/mahabharata.png', 'Vyasa', '140'),
  BookInfo(
      2,
      'Gita',
      'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
      'Vyasa',
      '290',
      ),
  BookInfo(
      3,
      'Brahma-Purana',
      'lib/assets/images/place_holder/mahabharata.png',
      'Ramananda',
      '159',
      ),
  BookInfo(
      4,
      'Shiva-Maha-Purana',
      'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
      'Vyasadeva',
      '270',
      ),
  BookInfo(
      5,
      'Garuda-Purana',
      'lib/assets/images/place_holder/mahabharata.png',
      'Vyasadeva',
      '160',
      ),
  BookInfo(
      5,
      'Vishnu-Purana',
      'lib/assets/images/place_holder/mahabharata.png',
      'Vyasadeva',
      '160',
      ),
  ];

const List<String> langs = [
  "English",
  "Hindi",
];


List<ArtiInfo> artis = [
  ArtiInfo('Shiv Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/shiv_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Lakshmi Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/lakshami_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Saraswati Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/saraswati_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Durga Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/durga_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Ambe Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/ambe_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Gayatri Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/gayatri_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Sri Ganesh Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/ganesh_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Sri jagdish Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/jagdish_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Sri Krishna Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/krishna_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Santoshi Mata Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/santoshi_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shri Ram Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/ram_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Kali Maa Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/mahakali_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shri Ganpati Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/hello.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Hanumaan Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/hanumaan_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Sharda Maa Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/sharda_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  //ArtiInfo('Maa Durga Arti'.tr, 'lib/assets/images/artis/ganpati1.png','lib/assets/markdown/artis/english/hello.md'),
  // ArtiInfo('Sai Baba Arti '.tr, 'lib/assets/images/artis/ganpati1.png',''),
  ArtiInfo('Shri Vishkarma ji Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/vishkarma_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shitla Maa Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/shitla_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shri Vishnu Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/vishnu_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Maa Vaishno Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/vaishnu_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Maa Paarvati Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/paarvati_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shri Bala ji Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/bala_g_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Shri Prshuram Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/parshuram_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Mahadev Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/mahadev_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
  ArtiInfo('Maa Ganga Arti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/english/ganga_aarti.md',
      'lib/assets/assets_music_music1.mp3'),
];
// List<ArtiInfo> artis = [
//   ArtiInfo('Shiv Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hello.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Lakshmi Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/lakshmi_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Saraswati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/saraswati_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Maa Durga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/durga_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Maa Ambe Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ambe_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Gayatri Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/gayatri_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri Ganesh Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ganesh_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri jagdish Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/jagdish_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri Krishna Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/krishna_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Santoshi Mata Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/santoshi_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Shri Ram Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ram_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Kali Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/mahakali_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Shri Ganpati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hello.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Hanumaan Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hanumaan_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Sharda Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/sharda_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   //ArtiInfo('Maa Durga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png','lib/assets/markdown/artis/hello.md'),
//   // ArtiInfo('Sai Baba Aarti '.tr, 'lib/assets/images/artis/ganpati1.png',''),
//   ArtiInfo('Shri Vishkarma ji Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vishkarma_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shitla Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/shitla_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri Vishnu Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vishnu_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Vaishno Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vaishnu_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Paarvati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/paarvati_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri Bala ji Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/bala_g_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Shri Prshuram Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/parshuram_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Mahadev Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/mahadev_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo('Maa Saraswati Aarti'.tr, 'lib/assets/images/artis/rabbit.png', 'lib/assets/markdown/artis/saraswati_aarti.md',
//       'lib/assets/assets_music_music1.mp3'),
//   ArtiInfo(
//       'Maa Ganga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ganga_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//   ];

// class List_Arti extends GetxController{
//   List<ArtiInfo> artis = [
//     ArtiInfo('Shiv Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hello.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Lakshmi Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/lakshmi_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Saraswati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/saraswati_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Maa Durga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/durga_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Maa Ambe Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ambe_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Gayatri Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/gayatri_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri Ganesh Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ganesh_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri jagdish Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/jagdish_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri Krishna Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/krishna_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Santoshi Mata Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/santoshi_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Shri Ram Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ram_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Kali Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/mahakali_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Shri Ganpati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hello.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Hanumaan Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/hanumaan_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Sharda Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/sharda_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     //ArtiInfo('Maa Durga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png','lib/assets/markdown/artis/hello.md'),
//     // ArtiInfo('Sai Baba Aarti '.tr, 'lib/assets/images/artis/ganpati1.png',''),
//     ArtiInfo('Shri Vishkarma ji Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vishkarma_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shitla Maa Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/shitla_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri Vishnu Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vishnu_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Vaishno Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/vaishnu_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Paarvati Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/paarvati_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri Bala ji Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/bala_g_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Shri Prshuram Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/parshuram_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Mahadev Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/mahadev_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo('Maa Saraswati Aarti'.tr, 'lib/assets/images/artis/rabbit.png', 'lib/assets/markdown/artis/saraswati_aarti.md',
//         'lib/assets/assets_music_music1.mp3'),
//     ArtiInfo(
//         'Maa Ganga Aarti'.tr, 'lib/assets/images/artis/ganpati1.png', 'lib/assets/markdown/artis/ganga_aarti.md', 'lib/assets/assets_music_music1.mp3'),
//     ];
// }