import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/models/arti.dart';
import 'package:pujapurohit/models/book.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [BoxShadow(color: (Colors.orange[400])!, blurRadius: 10, spreadRadius: 0.2, offset: Offset(2, 2))];

List<ArtiInfo> artis = [
  ArtiInfo('Shiv Arti', 'lib/assets/images/place_holder/cat.png'),
  ArtiInfo('Lakshmi Mata Arti', 'lib/assets/images/place_holder/dog.png'),
  ArtiInfo('Sarawati Arti', 'lib/assets/images/place_holder/horse.png'),
  ArtiInfo('Durga Mata Arti', 'lib/assets/images/place_holder/parrot.png'),
  ArtiInfo('Ambe Mata Arti', 'lib/assets/images/place_holder/rabbit.png'),
  ArtiInfo('Gayatri MAta Arti', 'lib/assets/images/place_holder/cat.png'),
  ArtiInfo('Sri Ganesha Arti', 'lib/assets/images/place_holder/dog.png'),
  ArtiInfo('Sri Gagdish Arti', 'lib/assets/images/place_holder/horse.png'),
  ArtiInfo('Sri Krishna Arti', 'lib/assets/images/place_holder/parrot.png'),
  ArtiInfo('Santoshi Mata Arti', 'lib/assets/images/place_holder/rabbit.png'),
];

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
    'Bharmha puran',
    'lib/assets/images/place_holder/mahabharata.png',
    'Ramananda',
    '159',
    bookPath: 'lib/assets/epub/hindi/Brahma-puran.epub',
  ),
  BookInfo(
    4,
    'Shiv Puran',
    'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
    'Vyasadeva',
    '270',
  ),
  BookInfo(
    5,
    'Gadur puran',
    'lib/assets/images/place_holder/mahabharata.png',
    'Vyasadeva',
    '160',
  ),
  BookInfo(
    5,
    'Vishnu Puran',
    'lib/assets/images/place_holder/mahabharata.png',
    'Vyasadeva',
    '160',
    bookPath: 'lib/assets/epub/hindi/Vishnu-puran.epub',
  ),
];
