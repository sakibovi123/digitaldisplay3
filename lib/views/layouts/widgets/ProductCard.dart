import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = 400;
    final ButtonStyle buttonStyleBlack = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF111111),
      shape: const StadiumBorder(),
      minimumSize: const Size(50, 40),
    );
    final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
      // fixedSize: ,
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(50, 40),
    );
    return Container(
      width: width,
      height: 320,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          ),
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.9,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 208, 87, 80)
                                .withOpacity(0.85),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 80,
                          width: 75,
                          child: Text(
                            '\$25',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$40',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.5,
                            decorationColor: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: width * 0.95,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    margin: EdgeInsets.only(left: 3),
                    height: 40,
                    width: 200,
                    color: Colors.white.withOpacity(0.8),
                    child: Text(
                      'Lorem Ipsum',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      style: buttonStyleBlack,
                      onPressed: () {},
                      child: Text('Edit product'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
