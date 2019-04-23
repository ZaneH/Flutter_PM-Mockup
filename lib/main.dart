import 'package:flutter/material.dart';
import 'overview_page.dart';

void main() => runApp(PropertyManApp());

class PropertyManApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverviewPage(),
    );
  }
}