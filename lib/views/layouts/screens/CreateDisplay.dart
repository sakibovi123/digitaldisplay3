import 'package:carousel_slider/carousel_slider.dart';
import 'package:digitaldisplay3/views/layouts/widgets/DisplayCard.dart';
import 'package:flutter/material.dart';

class CreateDisplay extends StatefulWidget {
  const CreateDisplay({super.key});

  @override
  State<CreateDisplay> createState() => _CreateDisplayState();
}

class _CreateDisplayState extends State<CreateDisplay> {
  @override
  final ButtonStyle buttonStyleBlack = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF111111),
    shape: const StadiumBorder(),
    minimumSize: const Size(50, 40),
  );
  final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
    // fixedSize: ,
    backgroundColor: const Color(0xFFc3232a),
    shape: const StadiumBorder(),
    minimumSize: const Size(30, 20),
  );

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ElevatedButton(
              style: buttonStyleRed,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 16,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
        title: const Text(
          'DIGITAL DISPLAY GENERATOR',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 40,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 330,
                  enableInfiniteScroll: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                itemCount: 6,
                itemBuilder: ((BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: DisplayCard(
                        id: 1,
                        shopName: 'Shop Dhanmondi',
                        displayName: 'Display Style 7',
                        templateName: "Template name",
                        image:
                            'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                        width: width,
                        height: height),
                  );
                }),
              ),
            ),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40,
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
