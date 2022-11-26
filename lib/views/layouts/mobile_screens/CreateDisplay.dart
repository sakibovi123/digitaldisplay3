import 'package:carousel_slider/carousel_slider.dart';
import 'package:digitaldisplay3/views/layouts/widgets/DisplayCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../export/Export.dart';

import '../../../controllers/DisplayController.dart';
import '../../../controllers/ProductController.dart';

class CreateDisplay extends StatefulWidget {
  const CreateDisplay({super.key});

  @override
  State<CreateDisplay> createState() => _CreateDisplayState();
}

class _CreateDisplayState extends State<CreateDisplay> {
  @override
  void initState() {
    Provider.of<DisplayController>(context, listen: false).getDisplays();
    Provider.of<ProductController>(context, listen: false).getProducts();
    super.initState();
  }

  int? isSelected;
  List<int> productIds = [];
  CarouselController controller = CarouselController();
  bool _init = true;
  bool _isLoadingDisplays = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoadingDisplays =
          await Provider.of<DisplayController>(context).getDisplays();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

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
    final displays = Provider.of<DisplayController>(context).displays;
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
          child: Column(
            children: [
              const SizedBox(
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
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  itemCount: 6,
                  itemBuilder:
                      ((BuildContext context, int index, int realIndex) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: DisplayCard(
                        id: displays[0].results![index].id!,
                        displayName: displays[0].results![index].name!,
                        templateName: displays[0].results![index].templateName!,
                        image: displays[0].results![index].catalogs![0].image!,
                        shopName: 'Shop Mohakhali',
                        height: height,
                        width: width,
                      ),
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
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.nextPage();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                height: 280,
                color: const Color.fromARGB(255, 67, 62, 68),
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name*:',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Banner Text:',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category Name:',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PRODUCTS DISPLAY',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<ProductController>(
                  builder: ((context, value, child) {
                    // log('${value.products[0].results?.length.toString()}');
                    if (value.products.isNotEmpty) {
                      return Container(
                          height: height * 0.3,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.products[0].results!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(
                                      value.products[0].results![index].name!),
                                  leading: InkWell(
                                    onTap: () {
                                      setState(() {
                                        var ids = value
                                            .products[0].results![index].id!;
                                        if (productIds.contains(ids)) {
                                          productIds.remove(ids);
                                        } else {
                                          productIds.add(ids);
                                          isSelected = index;
                                        }
                                        // productIds.add(value.products[0]
                                        //     .results![index].id!);

                                        print("products=>>>>$productIds");
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 90,
                                      child: Image.network(
                                          'https://www.safefood.net/getmedia/d81f679f-a5bc-4a16-a592-248d3b1dc803/burger_1.jpg?width=1280&height=720&ext=.jpg'),
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.done,
                                      color: isSelected == index
                                          ? Colors.blue
                                          : null,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        productIds.remove(value
                                            .products[0].results![index].id);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
                ),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => CreateProduct()),
                          ),
                        );
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
            ],
          ),
        ),
      ),
    );
  }
}
