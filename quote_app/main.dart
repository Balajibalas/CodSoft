import 'package:flutter/material.dart';
import 'package:quote_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          // You can customize other color properties here
        ),
        // useMaterial3 is deprecated and should be avoided
        // useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
