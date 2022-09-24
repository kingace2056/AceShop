import 'package:aceshop/models/services/auth_service.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/account_page.dart';
import 'package:aceshop/views/account/login_screen.dart';
import 'package:aceshop/views/account/signup_screen.dart';
import 'package:aceshop/views/category/category_page.dart';
import 'package:aceshop/my_homepage.dart';
import 'package:aceshop/views/home/home.dart';
import 'package:aceshop/views/product/product_page.dart';
import 'package:aceshop/views/search/search_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    final AuthService authService = AuthService();
    authService.getUserData(context: context);
    super.initState();
  }

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
        '/category': (context) => const CategoryPage(),
        '/myaccount': (context) => const MyAccount(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScr(),
        '/product': (context) => const ProductPage(),
      },
    );
  }
}
