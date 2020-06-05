import 'package:flutter/material.dart';
import 'baskara_page.dart';

void main() {
  runApp(BaskaraApp());
}

class BaskaraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        )),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaskaraPage(),
    );
  }
}

