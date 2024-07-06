import 'package:cocktail/Screens/HomePage.dart';
import 'package:cocktail/main.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CockTail Drinks",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity.copyWith(
          horizontal: -4,
          vertical: 2
        ),
        primarySwatch: Colors.red,
        fontFamily: "AlexBrush",
        appBarTheme: const AppBarTheme(
          color: myColor,
        )
      ),
      home: const HomePage(),
    );
  }
}