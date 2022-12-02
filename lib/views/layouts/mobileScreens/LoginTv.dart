import 'package:digitaldisplay3/controllers/UserController.dart';
import 'package:digitaldisplay3/views/export/Export.dart';
import 'package:digitaldisplay3/views/layouts/mobileScreens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenTv extends StatefulWidget {
  const LoginScreenTv({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  State<LoginScreenTv> createState() => _LoginScreenTvState();
}

class _LoginScreenTvState extends State<LoginScreenTv> {
  String _email = "";
  String _password = "";

  final _form = GlobalKey<FormState>();

  void _login() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    bool token = await Provider.of<UserController>(context, listen: false)
        .loginNow(_email, _password);
    if (token) {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something went wrong please try again!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 58, 50, 110),
                Color.fromARGB(255, 26, 22, 60),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.6,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter and valid email";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => {_email = value as String},
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 81, 73, 151),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 32, 28, 68),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 32, 28, 68),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width * 0.6,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return 'Enter Password..';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _password = value as String;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.key),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 81, 73, 151),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 32, 28, 68),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 32, 28, 68),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                        onTap: (() {
                          _login();
                        }),
                        child: const LoginButton()),
                    const SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       _login();
                    //     },
                    //     child: Text(
                    //       "Login",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Color(0xFF111111),
                    //       padding: EdgeInsets.all(10.0),
                    //       minimumSize: Size(120, 40),
                    //     ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
