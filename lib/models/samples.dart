import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/models/arti.dart';
import 'package:pujapurohit/models/book.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [BoxShadow(color: (Colors.grey[400])!, blurRadius: 30, offset: Offset(0, 10))];

List<ArtiInfo> artis = [
  ArtiInfo('Shiv Arti'.tr,'lib/images/cat.png'),
  ArtiInfo('Lakshmi Mata Arti'.tr,'lib/images/dog.png'),
  ArtiInfo('Sarawati Arti'.tr,'lib/images/horse.png'),
  ArtiInfo('Durga Mata Arti'.tr,'lib/images/parrot.png'),
  ArtiInfo('Ambe Mata Arti'.tr,'lib/images/rabbit.png'),
  ArtiInfo('Gayatri MAta Arti'.tr,'lib/images/cat.png'),
  ArtiInfo('Sri Ganesha Arti'.tr,'lib/images/dog.png'),
  ArtiInfo('Sri Gagdish Arti'.tr,'lib/images/horse.png'),
  ArtiInfo('Sri Krishna Arti'.tr,'lib/images/parrot.png'),
  ArtiInfo('Santoshi Mata Arti'.tr,'lib/images/rabbit.png'),
];

List<Map> navList = [
  {'icon': Icons.phone, 'title': 'Social Media'.tr},
  {'icon': Icons.markunread_mailbox_rounded, 'title': 'Donation'.tr},
  {'icon': Icons.add_rounded, 'title': 'Add books'.tr},
  {'icon': Icons.favorite_rounded, 'title': 'Favorites'.tr},
  {'icon': Icons.mail_rounded, 'title': 'Messages'.tr},
  {'icon': Icons.person, 'title': 'Profile'.tr},
];

List<BookInfo> books = [
  BookInfo(
    0,
    'Ramayaan'.tr,
    'lib/images/ramayan__1_-removebg-preview.png',
    'Valmiki'.tr,
    '250',
  ),
  BookInfo(1, 'Mahabharat'.tr, 'lib/images/mahabharata.png', 'Vyasa'.tr, '140'),
  BookInfo(
    2,
    'Gita'.tr,
    'lib/images/ramayan__1_-removebg-preview.png',
    'Vyasa'.tr,
    '290',
  ),
  BookInfo(
    3,
    'Bharmha puran'.tr,
    'lib/images/mahabharata.png',
    'Ramananda'.tr,
    '159',
  ),
  BookInfo(
    4,
    'Shiv Puran'.tr,
    'lib/images/ramayan__1_-removebg-preview.png',
    'Vyasadeva'.tr,
    '270',
  ),
  BookInfo(
    5,
    'Gadur puran'.tr,
    'lib/images/mahabharata.png',
    'Vyasadeva'.tr,
    '160',
  ),
];
