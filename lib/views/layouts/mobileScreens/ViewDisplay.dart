// import 'package:digitaldisplay/controllers/DisplayController.dart';
// import 'package:digitaldisplay/models/DisplayModel.dart';
import "../../../models/DisplayModel.dart";
import "../../../controllers/DisplayController.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewDisplay extends StatelessWidget {
  static const routeName = "/view-display";

  const ViewDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final displayId = ModalRoute.of(context)!.settings.arguments;
    final display =
        Provider.of<DisplayController>(context).singleDisplay(displayId as int);
    final displayImg = display.catalogs![0].image!;
    final productName = display.products![0].name!;
    final productImage = display.products![0].image;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 131, 50, 46),
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text('View Display'),
          ),
          body: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: display.products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: ((context, index) {
              return Container(
                width: width * 0.4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.35,
                      child: const Text(
                        'Starter',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width * 0.35,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width * 0.08,
                                  child: Text(
                                    display.products![index].price!,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: width * 0.27,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: width * 0.2,
                                          child: Text(
                                            display.products![index].name!,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        // Container(
                                        //   margin: EdgeInsets.only(left: 10),
                                        //   width: width * 0.2,
                                        //   child: Text(
                                        //     // display.products![index].category!,
                                        //     'This is category',
                                        //     style: TextStyle(
                                        //       fontSize: 18,
                                        //       color: Colors.white,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       width: width * 0.08,
                            //       child: Text(
                            //         display.products![index].price!,
                            //         style: TextStyle(
                            //           fontSize: 24,
                            //           fontWeight: FontWeight.w500,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         border: Border(
                            //           left: BorderSide(
                            //             width: 1,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       ),
                            //       width: width * 0.27,
                            //       child: Container(
                            //         margin: EdgeInsets.only(top: 25),
                            //         child: Column(
                            //           children: [
                            //             Container(
                            //               margin: EdgeInsets.only(left: 10),
                            //               width: width * 0.2,
                            //               child: Text(
                            //                 display.products![index].name!,
                            //                 style: TextStyle(
                            //                   fontSize: 22,
                            //                   fontWeight: FontWeight.w500,
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               height: 10,
                            //             ),
                            //             // Container(
                            //             //   margin: EdgeInsets.only(left: 10),
                            //             //   width: width * 0.2,
                            //             //   child: Text(
                            //             //     'Lorem ipsum dolor sit amet consectetuer adipiscing',
                            //             //     style: TextStyle(
                            //             //       fontSize: 18,
                            //             //       color: Colors.white,
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       width: width * 0.08,
                            //       child: Text(
                            //         '\$' + display.products![index].price!,
                            //         style: TextStyle(
                            //           fontSize: 24,
                            //           fontWeight: FontWeight.w500,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         border: Border(
                            //           left: BorderSide(
                            //             width: 1,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       ),
                            //       width: width * 0.27,
                            //       child: Container(
                            //         margin: EdgeInsets.only(top: 25),
                            //         child: Column(
                            //           children: [
                            //             Container(
                            //               margin: EdgeInsets.only(left: 10),
                            //               width: width * 0.2,
                            //               child: Text(
                            //                 display.products![index].name!,
                            //                 style: TextStyle(
                            //                   fontSize: 18,
                            //                   fontWeight: FontWeight.w500,
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               height: 10,
                            //             ),
                            //             // Container(
                            //             //   margin: EdgeInsets.only(left: 10),
                            //             //   width: width * 0.2,
                            //             //   child: Text(
                            //             //     'Lorem ipsum dolor sit amet consectetuer adipiscing',
                            //             //     style: TextStyle(
                            //             //       fontSize: 18,
                            //             //       color: Colors.white,
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          // Container(
          //   height: height,
          //   width: width,
          //   child: Stack(
          //     children: [
          //       Image.network(
          //         "https://digital-display.betafore.com/$displayImg",
          //         height: height,
          //         width: width,
          //         fit: BoxFit.cover,
          //       ),
          //     ],
          //   ),
          // ),
        );
      } else {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 131, 50, 46),
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text('View Display'),
          ),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          child: const Text(
                            'Starter',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * 0.17,
                                child: const Text(
                                  '\$100',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                width: width * 0.75,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Big Green Salad',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Lorem ipsum dolor sit amet consectetuer adipiscing',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * 0.17,
                                child: const Text(
                                  '\$100',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                width: width * 0.75,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        top: 30,
                                      ),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Vegan Kebab',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Lorem ipsum dolor sit amet consectetuer adipiscing',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * 0.17,
                                child: const Text(
                                  '\$100',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                width: width * 0.75,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        top: 30,
                                      ),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Red Spicy Onion Ring',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: width * 0.65,
                                      child: const Text(
                                        'Lorem ipsum dolor sit amet consectetuer adipiscing',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              );
            }),
          ),
          // Container(
          //   height: height,
          //   width: width,
          //   child: Stack(
          //     children: [
          //       Image.network(
          //         "https://digital-display.betafore.com/$displayImg",
          //         height: height,
          //         width: width,
          //         fit: BoxFit.cover,
          //       ),
          //     ],
          //   ),
          // ),
        );
      }
    });
  }
}
