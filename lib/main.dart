import 'package:capstonepro/chatbot.dart';
import 'package:capstonepro/halamandeteksi.dart';
import 'package:capstonepro/home.dart';
import 'package:capstonepro/peraturan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pendeteksi Jalan Rusak',
      initialRoute: '/',
      routes: {
        '/': (context) => halaman_utama(),
        '/halamandeteksi': (context) => halamandeteksi(),
        '/halamanchatbot': (context) => ChatBotApp(),
        '/halamanperaturan': (context) => halamanperaturan(),
      },
    );
  }
}
