import 'package:bmi_app/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BmiApp());
class BmiApp extends StatefulWidget
{
  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}