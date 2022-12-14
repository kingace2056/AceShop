import 'dart:developer';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:aceshop/models/services/auth_service.dart';
import 'package:aceshop/my_homepage.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/account_page.dart';
import 'package:aceshop/views/account/admin/add_product.dart';
import 'package:aceshop/views/account/user/login_screen.dart';
import 'package:aceshop/views/account/user/signup_screen.dart';
import 'package:aceshop/views/product/product_page.dart';
import 'package:aceshop/views/search/search_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
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
    final AuthService authService = AuthService();
    log('Err chk start \n');
    authService.getUserData(context: context);
    // getSharedPrefs();
    log('Err chk end \n');
    // getSharedPrefs();
    super.initState();
  }

  // getSharedPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString(
  //     'x-auth-token',
  //   );
  //   AuthService().getUserData;
  //   Provider.of<UserProvider>(context, listen: false).user.token;
  //   print('$token' + 'is token');
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
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
        '/search': (context) => const SearchMenuPage(),
        // '/category': (context) => const CategoryPage(category: '',),
        '/myaccount': (context) => const MyAccount(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScr(),

        '/addproduct': (context) => const AddProductScr(),
      },
    );
  }
}
