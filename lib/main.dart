import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_movieapp/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.redAccent,
  //     systemNavigationBarColor: Colors.indigo,
  //   ),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]).then((value) {
    runApp(MyApp());
  });

  //landscape - horizontal
  //portrait - vertical
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
