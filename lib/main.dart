import 'package:flutter/material.dart';
import 'package:flutter_visitroof_test/UI/album_screen.dart';
import 'package:flutter_visitroof_test/locator.dart';

void main() async{
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitroof Test Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AlbumListScreen(),
    );
  }
}

