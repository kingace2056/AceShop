import 'package:aceshop/views/category/category_page.dart';
import 'package:aceshop/views/home/my_homepage.dart';
import 'package:aceshop/views/search/search_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AceShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/search': (context) => const SearchPage(),
        '/category': (context) => const CategoryPage()
      },
    );
  }
}
