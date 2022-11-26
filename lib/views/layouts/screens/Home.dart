import 'package:digitaldisplay3/views/layouts/screens/CreateDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../export/Export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: buttonStyleBlack,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CreateDisplay()),
                    ),
                  );
                },
                child: const Text(
                  'Create Display',
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5 / 4,
                ),
                itemBuilder: ((context, index) {
                  return HomePageCard(
                    displayStyle: 'Display Style 7',
                    image:
                        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    shopName: 'Shop Mohakhali',
                    height: height,
                    width: width,
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: buttonStyleRed,
                    onPressed: () {},
                    child: const Text(
                      'Dashboard',
                    ),
                  ),
                  ElevatedButton(
                    style: buttonStyleBlack,
                    onPressed: () {},
                    child: const Text(
                      'Create Product',
                    ),
                  ),
                  ElevatedButton(
                    style: buttonStyleBlack,
                    onPressed: () {},
                    child: const Text(
                      'Logout',
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
