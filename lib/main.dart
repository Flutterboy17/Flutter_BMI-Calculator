import 'package:flutter/material.dart';

import 'Constants/app_constants.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      theme: ThemeData(primarySwatch: Colors.yellow,
      scaffoldBackgroundColor: mainHexColor,
      visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

