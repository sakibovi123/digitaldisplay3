// // import 'dart:io';

// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:digitaldisplay3/views/layouts/mobileScreens/CreateProduct.dart';
// // import 'package:digitaldisplay3/views/layouts/widgets/DisplayCard.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../../export/Export.dart';
// // import 'package:image_picker/image_picker.dart';

// // import '../../../controllers/DisplayController.dart';
// // import '../../../controllers/ProductController.dart';

// // class CreateDisplay extends StatefulWidget {
// //   static const routeName = "/edit-display";
// //   const CreateDisplay({super.key});

// //   @override
// //   State<CreateDisplay> createState() => _CreateDisplayState();
// // }

// // class _CreateDisplayState extends State<CreateDisplay> {
// //   final ImagePicker picker = ImagePicker();

// //   File? catalogImage;

// //   File? _catalogVideo;
// //   String _name = "";
// //   String _category = "";
// //   String _templateName = "";
// //   List<int> productIds = [];
// //   final _form = GlobalKey<FormState>();

// //   void _addDisplay() async {
// //     var isValid = _form.currentState!.validate();
// //     if (!isValid) {
// //       return;
// //     }
// //     _form.currentState!.save();
// //     bool create = await Provider.of<DisplayController>(context, listen: false)
// //         .addDisplay(_name, _category, _templateName, catalogImage!,
// //             _catalogVideo!, productIds);
// //     if (create) {
// //       print(create);
// //       showDialog(
// //           context: context,
// //           builder: (context) {
// //             return AlertDialog(
// //               title: Text("Created"),
// //               actions: [
// //                 ElevatedButton(
// //                   child: const Text("Return"),
// //                   onPressed: () {
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             );
// //           });
// //     } else {
// //       showDialog(
// //           context: context,
// //           builder: (context) {
// //             return AlertDialog(
// //               title: Text("Failed to create display!"),
// //               actions: [
// //                 ElevatedButton(
// //                   child: const Text("Return"),
// //                   onPressed: () {
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             );
// //           });
// //     }
// //   }

// //   @override
// //   void initState() {
// //     Provider.of<DisplayController>(context, listen: false).getDisplays();
// //     Provider.of<ProductController>(context, listen: false).getProducts();
// //     super.initState();
// //   }

// //   int? isSelected;
// //   CarouselController controller = CarouselController();
// //   bool _init = true;
// //   bool _isLoadingDisplays = false;

// //   @override
// //   void didChangeDependencies() async {
// //     if (_init) {
// //       _isLoadingDisplays =
// //           await Provider.of<DisplayController>(context).getDisplays();
// //       setState(() {});
// //     }
// //     _init = false;
// //     super.didChangeDependencies();
// //   }

// //   @override
// //   final ButtonStyle buttonStyleBlack = ElevatedButton.styleFrom(
// //     backgroundColor: const Color(0xFF111111),
// //     shape: const StadiumBorder(),
// //     minimumSize: const Size(50, 40),
// //   );
// //   final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
// //     // fixedSize: ,
// //     backgroundColor: const Color(0xFFc3232a),
// //     shape: const StadiumBorder(),
// //     minimumSize: const Size(50, 40),
// //   );
// //   final ButtonStyle imgPickerStyle = ElevatedButton.styleFrom(
// //     backgroundColor: Colors.grey,
// //   );

// //   Widget build(BuildContext context) {
// //     final displays = Provider.of<DisplayController>(context).displays;
// //     double height = MediaQuery.of(context).size.height;
// //     double width = MediaQuery.of(context).size.width;
// //     return LayoutBuilder(builder: (context, constraints) {
// //       if (constraints.maxWidth > 600) {
// //         return Scaffold(
// //           appBar: AppBar(
// //             actions: [
// //               Padding(
// //                 padding:
// //                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //                 child: ElevatedButton(
// //                   style: buttonStyleRed,
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Row(
// //                     children: const [
// //                       Icon(
// //                         Icons.arrow_back_ios_new_outlined,
// //                         size: 16,
// //                       ),
// //                       SizedBox(
// //                         width: 10,
// //                       ),
// //                       Text(
// //                         'Back',
// //                         style: TextStyle(fontSize: 12),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //             title: const Text(
// //               'DIGITAL DISPLAY GENERATOR',
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w500,
// //               ),
// //             ),
// //             automaticallyImplyLeading: false,
// //             elevation: 0,
// //             backgroundColor: const Color.fromARGB(255, 0, 0, 0),
// //             toolbarHeight: 40,
// //           ),
// //           body: SingleChildScrollView(
// //             physics: ScrollPhysics(),
// //             child: Container(
// //               margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
// //               child: Form(
// //                 key: _form,
// //                 child: Column(
// //                   children: [
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     Container(
// //                       child: CarouselSlider.builder(
// //                         carouselController: controller,
// //                         options: CarouselOptions(
// //                           height: 330,
// //                           enableInfiniteScroll: false,
// //                           aspectRatio: 16 / 9,
// //                           viewportFraction: 0.5,
// //                           autoPlay: true,
// //                           autoPlayInterval: const Duration(seconds: 3),
// //                         ),
// //                         itemCount: 6,
// //                         itemBuilder:
// //                             ((BuildContext context, int index, int realIndex) {
// //                           return Container(
// //                             margin: const EdgeInsets.only(right: 20),
// //                             child: DisplayCard(
// //                               id: displays[0].results![index].id!,
// //                               displayName: displays[0].results![index].name!,
// //                               templateName:
// //                                   displays[0].results![index].templateName!,
// //                               image: displays[0]
// //                                   .results![index]
// //                                   .catalogs![0]
// //                                   .image!,
// //                               shopName: 'Shop Mohakhali',
// //                               height: height,
// //                               width: width,
// //                             ),
// //                           );
// //                         }),
// //                       ),
// //                     ),
// //                     Container(
// //                       width: width,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {
// //                               controller.previousPage();
// //                             },
// //                             icon: const Icon(
// //                               Icons.keyboard_arrow_left_outlined,
// //                               size: 40,
// //                             ),
// //                           ),
// //                           IconButton(
// //                             onPressed: () {
// //                               controller.nextPage();
// //                             },
// //                             icon: const Icon(
// //                               Icons.keyboard_arrow_right_outlined,
// //                               size: 40,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(vertical: 10),
// //                       width: width,
// //                       height: 210,
// //                       color: const Color.fromARGB(255, 67, 62, 68),
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             children: [
// //                               Flexible(
// //                                 child: Container(
// //                                   margin:
// //                                       const EdgeInsets.symmetric(horizontal: 8),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       const Text(
// //                                         'Name*:',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 5,
// //                                       ),
// //                                       TextFormField(
// //                                         validator: (v) {
// //                                           if (v!.isEmpty) {
// //                                             return "Please Enter a valid name";
// //                                           } else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         onSaved: (value) {
// //                                           _name = value!;
// //                                         },
// //                                         decoration: const InputDecoration(
// //                                           filled: true,
// //                                           fillColor: Colors.white,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                               Flexible(
// //                                 child: Container(
// //                                   margin:
// //                                       const EdgeInsets.symmetric(horizontal: 8),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       const Text(
// //                                         'Banner Text:',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                         ),
// //                                       ),
// //                                       const SizedBox(height: 5),
// //                                       TextFormField(
// //                                         validator: (v) {
// //                                           if (v!.isEmpty) {
// //                                             return "Please Enter a valid name";
// //                                           } else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         onSaved: (value) {
// //                                           _templateName = value!;
// //                                         },
// //                                         decoration: const InputDecoration(
// //                                             filled: true,
// //                                             fillColor: Colors.white),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 30,
// //                           ),
// //                           Flexible(
// //                             child: Container(
// //                               margin: const EdgeInsets.symmetric(horizontal: 8),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   const Text(
// //                                     'Category Name:',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                     ),
// //                                   ),
// //                                   const SizedBox(height: 5),
// //                                   TextFormField(
// //                                     validator: (v) {
// //                                       if (v!.isEmpty) {
// //                                         return "Please Enter a valid name";
// //                                       } else {
// //                                         return null;
// //                                       }
// //                                     },
// //                                     onSaved: (value) {
// //                                       _category = value!;
// //                                     },
// //                                     decoration: const InputDecoration(
// //                                       filled: true,
// //                                       fillColor: Colors.white,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Row(
// //                       children: [
// //                         Flexible(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Container(
// //                               height: 120,
// //                               width: double.infinity,
// //                               child: ElevatedButton(
// //                                 style: imgPickerStyle,
// //                                 onPressed: () {
// //                                   _getImageFromGallery();
// //                                 },
// //                                 child: catalogImage != null
// //                                     ? Image.file(
// //                                         catalogImage!,
// //                                         fit: BoxFit.fill,
// //                                         width: double.infinity,
// //                                       )
// //                                     : Image.network(
// //                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         Flexible(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Container(
// //                               height: 120,
// //                               width: double.infinity,
// //                               child: ElevatedButton(
// //                                 style: imgPickerStyle,
// //                                 onPressed: () {
// //                                   _getVideoFromGallery();
// //                                 },
// //                                 child: catalogImage != null
// //                                     ? Image.file(
// //                                         catalogImage!,
// //                                         fit: BoxFit.fill,
// //                                         width: double.infinity,
// //                                       )
// //                                     : Image.network(
// //                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(
// //                       height: 25,
// //                     ),
// //                     const Align(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
// //                         'PRODUCTS DISPLAY',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(10.0),
// //                       child: Consumer<ProductController>(
// //                         builder: ((context, value, child) {
// //                           // log('${value.products[0].results?.length.toString()}');
// //                           if (value.products.isNotEmpty) {
// //                             return Container(
// //                                 height: height * 0.3,
// //                                 child: ListView.builder(
// //                                   physics: ClampingScrollPhysics(),
// //                                   shrinkWrap: true,
// //                                   itemCount: value.products[0].results!.length,
// //                                   itemBuilder: (context, index) {
// //                                     return Card(
// //                                       child: ListTile(
// //                                         title: Text(value
// //                                             .products[0].results![index].name!),
// //                                         leading: InkWell(
// //                                           onTap: () {
// //                                             setState(() {
// //                                               var ids = value.products[0]
// //                                                   .results![index].id!;
// //                                               if (productIds.contains(ids)) {
// //                                                 productIds.remove(ids);
// //                                               } else {
// //                                                 productIds.add(ids);
// //                                                 isSelected = index;
// //                                               }
// //                                               // productIds.add(value.products[0]
// //                                               //     .results![index].id!);

// //                                               print("products=>>>>$productIds");
// //                                             });
// //                                           },
// //                                           child: Container(
// //                                             height: 60,
// //                                             width: 90,
// //                                             child: Image.network(
// //                                                 'https://www.safefood.net/getmedia/d81f679f-a5bc-4a16-a592-248d3b1dc803/burger_1.jpg?width=1280&height=720&ext=.jpg'),
// //                                           ),
// //                                         ),
// //                                         trailing: IconButton(
// //                                           icon: Icon(
// //                                             Icons.done,
// //                                             color: isSelected == index
// //                                                 ? Colors.blue
// //                                                 : null,
// //                                           ),
// //                                           onPressed: () {
// //                                             setState(() {
// //                                               productIds.remove(value
// //                                                   .products[0]
// //                                                   .results![index]
// //                                                   .id);
// //                                             });
// //                                           },
// //                                         ),
// //                                       ),
// //                                     );
// //                                   },
// //                                 ));
// //                           } else {
// //                             return const CircularProgressIndicator();
// //                           }
// //                         }),
// //                       ),
// //                     ),
// //                     Container(
// //                       width: width * 0.9,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           ElevatedButton(
// //                             style: buttonStyleRed,
// //                             onPressed: () {},
// //                             child: const Text(
// //                               'Dashboard',
// //                             ),
// //                           ),
// //                           ElevatedButton(
// //                             style: buttonStyleBlack,
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: ((context) => CreateProduct()),
// //                                 ),
// //                               );
// //                             },
// //                             child: const Text(
// //                               'Create Product',
// //                             ),
// //                           ),
// //                           ElevatedButton(
// //                             style: buttonStyleBlack,
// //                             onPressed: () {},
// //                             child: const Text(
// //                               'Logout',
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       } else {
// //         return Scaffold(
// //           appBar: AppBar(
// //             actions: [
// //               Padding(
// //                 padding:
// //                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //                 child: ElevatedButton(
// //                   style: buttonStyleRed,
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Row(
// //                     children: const [
// //                       Icon(
// //                         Icons.arrow_back_ios_new_outlined,
// //                         size: 16,
// //                       ),
// //                       SizedBox(
// //                         width: 10,
// //                       ),
// //                       Text(
// //                         'Back',
// //                         style: TextStyle(fontSize: 12),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //             title: const Text(
// //               'DIGITAL DISPLAY GENERATOR',
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w500,
// //               ),
// //             ),
// //             automaticallyImplyLeading: false,
// //             elevation: 0,
// //             backgroundColor: const Color.fromARGB(255, 0, 0, 0),
// //             toolbarHeight: 40,
// //           ),
// //           body: SingleChildScrollView(
// //             physics: ScrollPhysics(),
// //             child: Container(
// //               margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
// //               child: Form(
// //                 key: _form,
// //                 child: Column(
// //                   children: [
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     Container(
// //                       child: CarouselSlider.builder(
// //                         carouselController: controller,
// //                         options: CarouselOptions(
// //                           height: 330,
// //                           enableInfiniteScroll: false,
// //                           aspectRatio: 16 / 9,
// //                           viewportFraction: 1,
// //                           autoPlay: true,
// //                           autoPlayInterval: const Duration(seconds: 3),
// //                         ),
// //                         itemCount: 6,
// //                         itemBuilder:
// //                             ((BuildContext context, int index, int realIndex) {
// //                           return Container(
// //                             margin: const EdgeInsets.only(right: 20),
// //                             child: DisplayCard(
// //                               id: displays[0].results![index].id!,
// //                               displayName: displays[0].results![index].name!,
// //                               templateName:
// //                                   displays[0].results![index].templateName!,
// //                               image: displays[0]
// //                                   .results![index]
// //                                   .catalogs![0]
// //                                   .image!,
// //                               shopName: 'Shop Mohakhali',
// //                               height: height,
// //                               width: width,
// //                             ),
// //                           );
// //                         }),
// //                       ),
// //                     ),
// //                     Container(
// //                       width: width,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {
// //                               controller.previousPage();
// //                             },
// //                             icon: const Icon(
// //                               Icons.keyboard_arrow_left_outlined,
// //                               size: 40,
// //                             ),
// //                           ),
// //                           IconButton(
// //                             onPressed: () {
// //                               controller.nextPage();
// //                             },
// //                             icon: const Icon(
// //                               Icons.keyboard_arrow_right_outlined,
// //                               size: 40,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(vertical: 10),
// //                       width: width,
// //                       height: 210,
// //                       color: const Color.fromARGB(255, 67, 62, 68),
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             children: [
// //                               Flexible(
// //                                 child: Container(
// //                                   margin:
// //                                       const EdgeInsets.symmetric(horizontal: 8),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       const Text(
// //                                         'Name*:',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 5,
// //                                       ),
// //                                       TextFormField(
// //                                         validator: (v) {
// //                                           if (v!.isEmpty) {
// //                                             return "Please Enter a valid name";
// //                                           } else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         onSaved: (value) {
// //                                           _name = value!;
// //                                         },
// //                                         decoration: const InputDecoration(
// //                                           filled: true,
// //                                           fillColor: Colors.white,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                               Flexible(
// //                                 child: Container(
// //                                   margin:
// //                                       const EdgeInsets.symmetric(horizontal: 8),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       const Text(
// //                                         'Banner Text:',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                         ),
// //                                       ),
// //                                       const SizedBox(height: 5),
// //                                       TextFormField(
// //                                         validator: (v) {
// //                                           if (v!.isEmpty) {
// //                                             return "Please Enter a valid name";
// //                                           } else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         onSaved: (value) {
// //                                           _templateName = value!;
// //                                         },
// //                                         decoration: const InputDecoration(
// //                                             filled: true,
// //                                             fillColor: Colors.white),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 30,
// //                           ),
// //                           Flexible(
// //                             child: Container(
// //                               margin: const EdgeInsets.symmetric(horizontal: 8),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   const Text(
// //                                     'Category Name:',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                     ),
// //                                   ),
// //                                   const SizedBox(height: 5),
// //                                   TextFormField(
// //                                     validator: (v) {
// //                                       if (v!.isEmpty) {
// //                                         return "Please Enter a valid name";
// //                                       } else {
// //                                         return null;
// //                                       }
// //                                     },
// //                                     onSaved: (value) {
// //                                       _category = value!;
// //                                     },
// //                                     decoration: const InputDecoration(
// //                                       filled: true,
// //                                       fillColor: Colors.white,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Row(
// //                       children: [
// //                         Flexible(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Container(
// //                               height: 120,
// //                               width: double.infinity,
// //                               child: ElevatedButton(
// //                                 style: imgPickerStyle,
// //                                 onPressed: () {
// //                                   _getImageFromGallery();
// //                                 },
// //                                 child: catalogImage != null
// //                                     ? Image.file(
// //                                         catalogImage!,
// //                                         fit: BoxFit.fill,
// //                                         width: double.infinity,
// //                                       )
// //                                     : Image.network(
// //                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         Flexible(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Container(
// //                               height: 120,
// //                               width: double.infinity,
// //                               child: ElevatedButton(
// //                                 style: imgPickerStyle,
// //                                 onPressed: () {
// //                                   _getVideoFromGallery();
// //                                 },
// //                                 child: catalogImage != null
// //                                     ? Image.file(
// //                                         catalogImage!,
// //                                         fit: BoxFit.fill,
// //                                         width: double.infinity,
// //                                       )
// //                                     : Image.network(
// //                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(
// //                       height: 25,
// //                     ),
// //                     const Align(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
// //                         'PRODUCTS DISPLAY',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(10.0),
// //                       child: Consumer<ProductController>(
// //                         builder: ((context, value, child) {
// //                           // log('${value.products[0].results?.length.toString()}');
// //                           if (value.products.isNotEmpty) {
// //                             return Container(
// //                                 height: height * 0.3,
// //                                 child: ListView.builder(
// //                                   physics: ClampingScrollPhysics(),
// //                                   shrinkWrap: true,
// //                                   itemCount: value.products[0].results!.length,
// //                                   itemBuilder: (context, index) {
// //                                     return Card(
// //                                       child: ListTile(
// //                                         title: Text(value
// //                                             .products[0].results![index].name!),
// //                                         leading: InkWell(
// //                                           onTap: () {
// //                                             setState(() {
// //                                               var ids = value.products[0]
// //                                                   .results![index].id!;
// //                                               if (productIds.contains(ids)) {
// //                                                 productIds.remove(ids);
// //                                               } else {
// //                                                 productIds.add(ids);
// //                                                 isSelected = index;
// //                                               }
// //                                               // productIds.add(value.products[0]
// //                                               //     .results![index].id!);

// //                                               print("products=>>>>$productIds");
// //                                             });
// //                                           },
// //                                           child: Container(
// //                                             height: 60,
// //                                             width: 90,
// //                                             child: Image.network(
// //                                                 'https://www.safefood.net/getmedia/d81f679f-a5bc-4a16-a592-248d3b1dc803/burger_1.jpg?width=1280&height=720&ext=.jpg'),
// //                                           ),
// //                                         ),
// //                                         trailing: IconButton(
// //                                           icon: Icon(
// //                                             Icons.done,
// //                                             color: isSelected == index
// //                                                 ? Colors.blue
// //                                                 : null,
// //                                           ),
// //                                           onPressed: () {
// //                                             setState(() {
// //                                               productIds.remove(value
// //                                                   .products[0]
// //                                                   .results![index]
// //                                                   .id);
// //                                             });
// //                                           },
// //                                         ),
// //                                       ),
// //                                     );
// //                                   },
// //                                 ));
// //                           } else {
// //                             return const CircularProgressIndicator();
// //                           }
// //                         }),
// //                       ),
// //                     ),
// //                     Container(
// //                       width: width * 0.9,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           ElevatedButton(
// //                             style: buttonStyleRed,
// //                             onPressed: () {},
// //                             child: const Text(
// //                               'Dashboard',
// //                             ),
// //                           ),
// //                           ElevatedButton(
// //                             style: buttonStyleBlack,
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: ((context) => CreateProduct()),
// //                                 ),
// //                               );
// //                             },
// //                             child: const Text(
// //                               'Create Product',
// //                             ),
// //                           ),
// //                           ElevatedButton(
// //                             style: buttonStyleBlack,
// //                             onPressed: () {},
// //                             child: const Text(
// //                               'Logout',
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       }
// //     });
// //   }

// //   void _getImageFromGallery() async {
// //     XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         catalogImage = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   void _getVideoFromGallery() async {
// //     XFile? filepick = await picker.pickVideo(source: ImageSource.gallery);
// //     if (filepick != null) {
// //       setState(() {
// //         _catalogVideo = File(filepick.path);
// //       });
// //     }
// //   }
// // }



// import 'dart:io';
// import 'package:digitaldisplay3/views/layouts/mobileScreens/CreateProduct.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// import '../../../controllers/ProductController.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import '../../export/Export.dart';
// import 'package:flutter/foundation.dart';

// class EditProduct extends StatefulWidget {
//   static const routeName = "/edit-product";

//   const EditProduct({super.key});

//   @override
//   State<EditProduct> createState() => _EditProductState();
// }

// class _EditProductState extends State<EditProduct> {
//   final ImagePicker picker = ImagePicker();
//   @override
//   void initState() {
//     Provider.of<ProductController>(context, listen: false).getProducts();
//     super.initState();
//   }

//   String _name = "";
//   String _price = "";
//   File? image;
//   final _form = GlobalKey<FormState>();

//   void _createProduct() async {
//     var isValid = _form.currentState!.validate();

//     if (!isValid) {
//       return;
//     }

//     _form.currentState!.save();
//     bool create = await Provider.of<ProductController>(context, listen: false)
//         .createProduct(_name, _price, image!);

//     if (create) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               actions: [
//                 ElevatedButton(
//                   child: const Text("Return"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           });
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Failed to create display!"),
//               actions: [
//                 ElevatedButton(
//                   child: const Text("Return"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productId = ModalRoute.of(context)!.settings.arguments;
//     final product = Provider.of<ProductController>(context)
//         .productDetails(productId as int);
//     final products = Provider.of<ProductController>(context).products;
//     final productName = product.name;
//     final productPrice = product.price;
//     final salePrice = product.salePrice;
//     final productImg = product.image;

//     double width = MediaQuery.of(context).size.width;
//     final ButtonStyle buttonStyleBlack = ElevatedButton.styleFrom(
//       backgroundColor: const Color(0xFF111111),
//       shape: const StadiumBorder(),
//       minimumSize: const Size(50, 40),
//     );
//     final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
//       // fixedSize: ,
//       backgroundColor: const Color(0xFFc3232a),
//       shape: const StadiumBorder(),
//       minimumSize: const Size(50, 40),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             child: ElevatedButton(
//               style: buttonStyleRed,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.arrow_back_ios_new_outlined,
//                     size: 16,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'Back',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         title: const Text(
//           'CREATE PRODUCT',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//         toolbarHeight: 40,
//       ),
//       body: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         child: Form(
//           key: _form,
//           child: Container(
//             margin: const EdgeInsets.only(
//               left: 10,
//               right: 10,
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   height: 375,
//                   width: width,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 0.5,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       // Image container
//                       Container(
//                         height: 370,
//                         width: width * 0.5,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage("${product.image}"),
//                           ),
//                           border: Border.all(
//                             width: 0.5,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         child: image == null
//                             ? Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: UnconstrainedBox(
//                                   child: ElevatedButton(
//                                     style: buttonStyleRed,
//                                     onPressed: () {
//                                       _getProductImage();
//                                     },
//                                     child: Text('Add image'),
//                                   ),
//                                 ),
//                               )
//                             : Flexible(
//                                 child: Image.file(
//                                   image!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                       ),
//                       Container(
//                         width: width * 0.4,
//                         child: Column(
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Product Name:',
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.grey,
//                                           width: 0.5,
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Enter Valid Name";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         onSaved: (value) {
//                                           _name = value as String;
//                                         },
//                                         decoration: const InputDecoration(
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Price*:',
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.grey,
//                                           width: 0.5,
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Enter Valid Name";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         onSaved: (value) {
//                                           _price = value as String;
//                                         },
//                                         decoration: const InputDecoration(
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Discount Price:',
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.grey,
//                                           width: 0.5,
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Enter Valid Name";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         onSaved: (value) {
//                                           _price = value as String;
//                                         },
//                                         decoration: const InputDecoration(
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Badge',
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.grey,
//                                           width: 0.5,
//                                         ),
//                                       ),
//                                       child: TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Enter Valid Name";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         onSaved: (value) {
//                                           _price = value as String;
//                                         },
//                                         decoration: const InputDecoration(
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: Container(
//                                 margin: const EdgeInsets.only(
//                                   right: 10,
//                                   bottom: 5,
//                                 ),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color.fromARGB(
//                                         255, 241, 245, 248),
//                                     shape: const StadiumBorder(),
//                                     minimumSize: const Size(50, 40),
//                                     side: const BorderSide(
//                                       width: 0.5,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Add Product',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),

//                 SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   width: width,
//                   height: 700,
//                   child: Consumer<ProductController>(
//                     builder: (context, value, child) => GridView.count(
//                       scrollDirection: Axis.vertical,
//                       crossAxisCount: 4,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 30,
//                       childAspectRatio: 16 / 9,
//                       children: List.generate(
//                           value.products.isNotEmpty
//                               ? value.products[0].results!.length
//                               : 0, (i) {
//                         return ProductCard(
//                             name: value.products[0].results![i].name!,
//                             price: value.products[0].results![i].price!,
//                             image: value.products[0].results![i].image!,
//                             id: value.products[0].results![i].id!);
//                       }),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   width: width * 0.9,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         style: buttonStyleRed,
//                         onPressed: () {},
//                         child: const Text(
//                           'Dashboard',
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: buttonStyleBlack,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: ((context) => CreateProduct()),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Create Product',
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: buttonStyleBlack,
//                         onPressed: () {},
//                         child: const Text(
//                           'Logout',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _getProductImage() async {
//     XFile? filepick = await picker.pickImage(source: ImageSource.gallery);
//     if (filepick != null) {
//       setState(() {
//         image = File(filepick.path);
//       });
//     }
//   }
// }


// Container(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: width,
//               child: Text(
//                 'Starter',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               width: width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: width * 0.17,
//                     child: Text(
//                       '\$100',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         left: BorderSide(
//                           color: Colors.white,
//                           width: 1.5,
//                         ),
//                       ),
//                     ),
//                     width: width * 0.75,
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 5),
//                           width: width * 0.65,
//                           child: Text(
//                             'Big Green Salad',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 5),
//                           width: width * 0.65,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: width * 0.17,
//                     child: Text(
//                       '\$100',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         left: BorderSide(
//                           color: Colors.white,
//                           width: 1.5,
//                         ),
//                       ),
//                     ),
//                     width: width * 0.75,
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                             left: 5,
//                             top: 30,
//                           ),
//                           width: width * 0.65,
//                           child: Text(
//                             'Vegan Kebab',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 5),
//                           width: width * 0.65,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: width * 0.17,
//                     child: Text(
//                       '\$100',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         left: BorderSide(
//                           color: Colors.white,
//                           width: 1.5,
//                         ),
//                       ),
//                     ),
//                     width: width * 0.75,
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                             left: 5,
//                             top: 30,
//                           ),
//                           width: width * 0.65,
//                           child: Text(
//                             'Red Spicy Onion Ring',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 5),
//                           width: width * 0.65,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),





// Scaffold(
//       backgroundColor: Color.fromARGB(255, 131, 50, 46),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: Text('View Display'),
//       ),
//       body: ListView.builder(
//         scrollDirection: Axis.vertical,
//         physics: ClampingScrollPhysics(),
//         itemCount: 4,
//         itemBuilder: ((context, index) {
//           return Column(
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       width: width,
//                       child: Text(
//                         'Starter',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       width: width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width * 0.17,
//                             child: Text(
//                               '\$100',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 left: BorderSide(
//                                   color: Colors.white,
//                                   width: 1.5,
//                                 ),
//                               ),
//                             ),
//                             width: width * 0.75,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(left: 5),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Big Green Salad',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 5),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width * 0.17,
//                             child: Text(
//                               '\$100',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 left: BorderSide(
//                                   color: Colors.white,
//                                   width: 1.5,
//                                 ),
//                               ),
//                             ),
//                             width: width * 0.75,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                     left: 5,
//                                     top: 30,
//                                   ),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Vegan Kebab',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 5),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: width * 0.17,
//                             child: Text(
//                               '\$100',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 left: BorderSide(
//                                   color: Colors.white,
//                                   width: 1.5,
//                                 ),
//                               ),
//                             ),
//                             width: width * 0.75,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                     left: 5,
//                                     top: 30,
//                                   ),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Red Spicy Onion Ring',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 5),
//                                   width: width * 0.65,
//                                   child: Text(
//                                     'Lorem ipsum dolor sit amet consectetuer adipiscing',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               // copy till here
              
//               SizedBox(
//                 height: 60,
//               ),
//             ],
//           );
//         }),
//       ),
//       // Container(
//       //   height: height,
//       //   width: width,
//       //   child: Stack(
//       //     children: [
//       //       Image.network(
//       //         "https://digital-display.betafore.com/$displayImg",
//       //         height: height,
//       //         width: width,
//       //         fit: BoxFit.cover,
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );