import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  DisplayCard({
    super.key,
    required this.shopName,
    required this.displayName,
    required this.image,
    required this.width,
    required this.height,
    required this.templateName,
    required this.id,
  });

  final int id;
  final String shopName;
  final String displayName;
  final String image;
  final double width;
  final double height;
  final String templateName;

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
      height: 330,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: const Color.fromARGB(141, 158, 158, 158),
        ),
        color: Colors.white,
        borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(30),
          topStart: Radius.circular(30),
        ),
        boxShadow: const [
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
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    shopName,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFc3232a),
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    displayName,
                    style: const TextStyle(
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
              "https://digital-display.betafore.com$image",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
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
                    children: const [
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
                  child: const Text(
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
