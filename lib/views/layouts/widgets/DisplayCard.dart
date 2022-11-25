import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageCard extends StatelessWidget {
  HomePageCard({
    super.key,
    required this.shopName,
    required this.displayStyle,
    required this.image,
    required this.width,
    required this.height,
  });
  final String shopName;
  final String displayStyle;
  final String image;
  final double width;
  final double height;
  @override
  final ButtonStyle buttonStyleBlack = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF111111),
    shape: const StadiumBorder(),
    minimumSize: const Size(50, 40),
  );
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      height: 320,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            spreadRadius: -8,
            blurRadius: 15,
            color: Color.fromARGB(137, 74, 74, 74),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF111111),
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    shopName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFc3232a),
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    displayStyle,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5),
            ),
            width: width * 0.9,
            height: height * 0.3,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: buttonStyleBlack,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_calendar_outlined,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Edit',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: buttonStyleBlack,
                  onPressed: () {},
                  child: Text(
                    'View Display',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
