import 'dart:developer';

import 'package:aceshop/models/constraints/constraints.dart';
import 'package:aceshop/models/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool? termS = false;

class SignUpScr extends StatefulWidget {
  const SignUpScr({super.key});

  @override
  State<SignUpScr> createState() => _SignUpScrState();
}

class _SignUpScrState extends State<SignUpScr> {
  bool obsq = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailcontroller.dispose();
    _pwcontroller.dispose();
    super.dispose();
  }

  final _emailcontroller = TextEditingController();
  final _pwcontroller = TextEditingController();
  final _nameController = TextEditingController();
  bool submitted = false;
  final _email = '';
  final _pass = '';
  final _name = '';
  final AuthService authService = AuthService();
  void signUp() {
    authService.signUpUser(
        context: context,
        email: _emailcontroller.text,
        password: _pwcontroller.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: defpad + const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome to AceShop',
                  style: TextStyle(
                      color: primaryBlk,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Lets join us by creating account',
                  style: TextStyle(color: secDarkGrey, fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        onChanged: ((value) => setState(() => _name)),
                        decoration: InputDecoration(
                          errorText: 'Name can\'t be empty',
                          filled: true,
                          fillColor: secSoftGrey,
                          hintText: 'Jon Doe',
                          label: const Text(
                            'Full Name',
                            style: TextStyle(
                              color: primaryBlk,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Name can\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailcontroller,
                        onChanged: ((value) => setState(() => _email)),
                        decoration: InputDecoration(
                          errorText: submitted ? errorTextEmail() : null,
                          filled: true,
                          fillColor: secSoftGrey,
                          hintText: 'someone@aceshop.com',
                          label: const Text(
                            'Email / Phone',
                            style: TextStyle(
                              color: primaryBlk,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Email can\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: obsq,
                        onChanged: ((value) => setState(() => _pass)),
                        controller: _pwcontroller,
                        decoration: InputDecoration(
                          errorText: submitted ? errorTextPw() : null,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsq = !obsq;
                                log(obsq.toString());
                              });
                            },
                            icon: Icon(
                              obsq
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              color: secDarkGrey,
                            ),
                          ),
                          filled: true,
                          fillColor: secSoftGrey,
                          hintText: '********',
                          label: const Text(
                            'Password',
                            style: TextStyle(
                              color: primaryBlk,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Password can\'t be empty';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    enableFeedback: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'I agree to',
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'terms and conditions',
                              style: TextStyle(fontSize: 15),
                            ))
                      ],
                    ),
                    value: termS,
                    onChanged: (value) {
                      setState(() {
                        termS = value;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: submitted == true && termS == false,
                  child: Text(
                    'Please accept terms and conditions ',
                    style: TextStyle(color: secRed),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          submitted = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          signUp();
                        }
                      },
                      child: const Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: primaryWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? errorTextEmail() {
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    String emailText = _emailcontroller.value.text;
    if (!regex.hasMatch(emailText)) return 'Enter a valid email address';
    // at any time, we can get the text from _controller.value.text
    final text = _emailcontroller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  String? errorTextPw() {
    final RegExp regex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    // at any time, we can get the text from _controller.value.text

    String pwText = _emailcontroller.value.text;
    if (!regex.hasMatch(pwText))
      return 'Password Must contain Lowercase, Uppercase, Special character and atleast length of 6';
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (pwText.isEmpty) {
      return 'Can\'t be empty';
    }
    if (pwText.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }
}
