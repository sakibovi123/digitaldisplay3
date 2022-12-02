import 'dart:io';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../controllers/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../export/Export.dart';
import 'package:flutter/foundation.dart';

class CreateProduct extends StatefulWidget {
  static const routeName = "/create_-product";
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProducts();
    super.initState();
  }

  String _name = "";
  String _price = "";
  File? image;
  final _form = GlobalKey<FormState>();

  void _createProduct() async {
    var isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    bool create = await Provider.of<ProductController>(context, listen: false)
        .createProduct(_name, _price, image!);

    if (create) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Failed to create product!"),
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'CREATE PRODUCT',
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Form(
          key: _form,
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 375,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      // Image container
                      Container(
                        height: 370,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                          ),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        child: image == null
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: UnconstrainedBox(
                                  child: ElevatedButton(
                                    style: buttonStyleRed,
                                    onPressed: () {
                                      _getProductImage();
                                    },
                                    child: Text('Add image'),
                                  ),
                                ),
                              )
                            : Flexible(
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      Container(
                        width: width * 0.4,
                        child: Column(
                          children: [
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Product Name:',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Valid Name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (value) {
                                          _name = value as String;
                                        },
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Price*:',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Valid Name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (value) {
                                          _price = value as String;
                                        },
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Discount Price:',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Valid Name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (value) {
                                          _price = value as String;
                                        },
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                  bottom: 5,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 241, 245, 248),
                                    shape: const StadiumBorder(),
                                    minimumSize: const Size(50, 40),
                                    side: const BorderSide(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onPressed: () {
                                    _createProduct();
                                  },
                                  child: const Text(
                                    'Add Product',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 15,
                ),

                Container(
                  width: width,
                  height: 700,
                  child: Consumer<ProductController>(
                    builder: (context, value, child) => GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.products.isNotEmpty
                          ? value.products[0].results!.length
                          : 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: (BuildContext context, int i) {
                        return ProductCard(
                          name: value.products[0].results![i].name!,
                          price: value.products[0].results![i].price!,
                          image: value.products[0].results![i].image!,
                          id: value.products[0].results![i].id!,
                        );
                      },
                      // scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      // crossAxisCount: 4,
                      // crossAxisSpacing: 20,
                      // mainAxisSpacing: 30,
                      // childAspectRatio: 16 / 9,
                      // children: List.generate(
                      //     value.products.isNotEmpty
                      //         ? value.products[0].results!.length
                      //         : 0, (i) {
                      //   return ProductCard(
                      //       name: value.products[0].results![i].name!,
                      //       price: value.products[0].results![i].price!,
                      //       image: value.products[0].results![i].image!,
                      //       id: value.products[0].results![i].id!);
                      // }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: buttonStyleRed,
                        onPressed: () {
                          Navigator.of(context).pushNamed(Home.routeName);
                        },
                        child: const Text(
                          'Dashboard',
                        ),
                      ),
                      ElevatedButton(
                        style: buttonStyleBlack,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(CreateProduct.routeName);
                        },
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
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getProductImage() async {
    XFile? filepick = await picker.pickImage(source: ImageSource.gallery);
    if (filepick != null) {
      setState(() {
        image = File(filepick.path);
      });
    }
  }
}
