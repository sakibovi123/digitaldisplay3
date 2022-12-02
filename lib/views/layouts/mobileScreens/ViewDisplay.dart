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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Image.network(
              "https://digital-display.betafore.com/$displayImg",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
