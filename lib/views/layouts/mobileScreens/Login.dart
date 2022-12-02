import 'package:digitaldisplay3/controllers/UserController.dart';
import 'package:digitaldisplay3/views/export/Export.dart';
import 'package:digitaldisplay3/views/layouts/mobileScreens/Home.dart';
import 'package:digitaldisplay3/views/layouts/mobileScreens/LoginMobile.dart';
import 'package:digitaldisplay3/views/layouts/mobileScreens/LoginTv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        return LoginScreenTv();
      } else {
        return LoginScreenMobile();
      }
    });
  }
}
