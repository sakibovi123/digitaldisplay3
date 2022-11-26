import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digitaldisplay3/views/layouts/widgets/DisplayCard.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CreateDisplay extends StatefulWidget {
  const CreateDisplay({super.key});

  @override
  State<CreateDisplay> createState() => _CreateDisplayState();
}

class _CreateDisplayState extends State<CreateDisplay> {
  CarouselController controller = CarouselController();
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

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
    minimumSize: const Size(50, 40),
  );

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ElevatedButton(
              style: buttonStyleRed,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
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
        title: Text(
          'DIGITAL DISPLAY GENERATOR',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    height: 330,
                    enableInfiniteScroll: false,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  itemCount: 6,
                  itemBuilder:
                      ((BuildContext context, int index, int realIndex) {
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      child: HomePageCard(
                          shopName: 'Shop Dhanmondi',
                          displayStyle: 'Display Style 7',
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
                      onPressed: () {
                        controller.previousPage();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.nextPage();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(5),
                //   border: Border.all(
                //       color: Color.fromARGB(253, 158, 158, 158), width: 0.5,),
                // ),
                child: DropdownButton<String>(
                  elevation: 8,
                  value: value,
                  iconSize: 30,
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: ((value) {
                    setState((() => this.value = value));
                  }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: buttonStyleRed,
                  onPressed: () {},
                  child: Text(
                    'Delete',
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'This action can\'t be undone',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 107, 126, 139),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Go to this Link to Display:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 91, 91, 91),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                height: 40,
                color: Color.fromARGB(255, 67, 62, 68),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width,
                height: 0.65,
                color: Color.fromARGB(255, 67, 62, 68),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: width,
                color: Color.fromARGB(255, 67, 62, 68),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.4,
                        child: Column(
                          children: [
                            Text('Name*:'),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: width * 0.4,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Banner Text:',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
