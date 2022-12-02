import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 215, 76, 145);
    Color color2 = Color.fromARGB(255, 232, 151, 110);
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 200),
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 16,
            offset: Offset(-8, 0),
          ),
          BoxShadow(
            color: color2.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 16,
            offset: Offset(8, 0),
          ),
          BoxShadow(
            color: color1.withOpacity(0.2),
            spreadRadius: 16,
            blurRadius: 32,
            offset: Offset(-8, 0),
          ),
          BoxShadow(
            color: color2.withOpacity(0.2),
            spreadRadius: 16,
            blurRadius: 32,
            offset: Offset(8, 0),
          ),
        ],
      ),
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
