import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginassign/home.dart';
import 'package:loginassign/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final _userNameController = TextEditingController();
  final _PasswordController = TextEditingController();

  bool _isdatamatched = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 76, 99, 1),
        appBar: AppBar(
          toolbarHeight: 200,
          centerTitle: true,
          title: Text(
            'Welcome',
            style: GoogleFonts.imFellDwPica(fontSize: 60, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 95, 157, 174),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(  
              bottom: Radius.circular(200),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: _userNameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'username',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: _PasswordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'password',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !_isdatamatched,
                        child: Text('Username or Password incorrect',
                            style: TextStyle(color: Colors.red, fontSize: 15)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 95, 157, 174)),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            print('data empty');
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _userNameController.text;

    final _password = _PasswordController.text;
    if (_username == 'jithin' && _password == '123') {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: ((ctx) => Home())));
    } else {
      setState(() {
        _isdatamatched = false;
      });
    }
  }
}
