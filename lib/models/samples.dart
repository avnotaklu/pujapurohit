import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/models/arti.dart';
import 'package:pujapurohit/models/book.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [BoxShadow(color: (Colors.grey[400])!, blurRadius: 30, offset: Offset(0, 10))];

List<ArtiInfo> artis = [
  ArtiInfo('Shiv Arti','lib/assets/images/place_holder/cat.png'),
  ArtiInfo('Lakshmi Mata Arti','lib/assets/images/place_holder/dog.png'),
  ArtiInfo('Sarawati Arti','lib/assets/images/place_holder/horse.png'),
  ArtiInfo('Durga Mata Arti','lib/assets/images/place_holder/parrot.png'),
  ArtiInfo('Ambe Mata Arti','lib/assets/images/place_holder/rabbit.png'),
  ArtiInfo('Gayatri MAta Arti','lib/assets/images/place_holder/cat.png'),
  ArtiInfo('Sri Ganesha Arti','lib/assets/images/place_holder/dog.png'),
  ArtiInfo('Sri Gagdish Arti','lib/assets/images/place_holder/horse.png'),
  ArtiInfo('Sri Krishna Arti','lib/assets/images/place_holder/parrot.png'),
  ArtiInfo('Santoshi Mata Arti','lib/assets/images/place_holder/rabbit.png'),
];

List<Map> navList = [
  {'icon': Icons.phone, 'title': 'Social Media'},
  {'icon': Icons.markunread_mailbox_rounded, 'title': 'Donation'},
  {'icon': Icons.add_rounded, 'title': 'Add books'},
  {'icon': Icons.favorite_rounded, 'title': 'Favorites'},
  {'icon': Icons.mail_rounded, 'title': 'Messages'},
  {'icon': Icons.person, 'title': 'Profile'},
];

List<BookController> books = [
  BookController(
    0,
    'Ramayaan',
    'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
    'Valmiki',
    '250',
  ),
  BookController(1, 'Mahabharat', 'lib/assets/images/place_holder/mahabharata.png', 'Vyasa', '140'),
  BookController(
    2,
    'Gita',
    'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
    'Vyasa',
    '290',
  ),
  BookController(
    3,
    'Bharmha puran',
    'lib/assets/images/place_holder/mahabharata.png',
    'Ramananda',
    '159',
  ),
  BookController(
    4,
    'Shiv Puran',
    'lib/assets/images/place_holder/ramayan__1_-removebg-preview.png',
    'Vyasadeva',
    '270',
  ),
  BookController(
    5,
    'Gadur puran',
    'lib/assets/images/place_holder/mahabharata.png',
    'Vyasadeva',
    '160',
  ),
];
