import 'package:digitaldisplay3/views/layouts/mobile_screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'views/export/Export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserController()),
        ChangeNotifierProvider(create: (ctx) => DisplayController()),
        ChangeNotifierProvider(create: (ctx) => ProductController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),

        routes: {
          Home.routeName: (ctx) => const Home(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
      ),
    );
  }
}
