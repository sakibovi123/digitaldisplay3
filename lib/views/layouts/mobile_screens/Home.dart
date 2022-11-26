import 'package:digitaldisplay3/views/layouts/mobile_screens/CreateDisplay.dart';
import 'package:flutter/material.dart';
import '../../export/Export.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

    final displays = Provider.of<DisplayController>(context).displays;

    if (!_isLoadingDisplays) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
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
                  itemCount: displays[0].results!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 4,
                  ),
                  itemBuilder: ((context, index) {
                    return DisplayCard(
                      id: displays[0].results![index].id!,
                      displayName: displays[0].results![index].name!,
                      templateName: displays[0].results![index].templateName!,
                      image: displays[0].results![index].catalogs![0].image!,
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
      );
    }
  }
}
