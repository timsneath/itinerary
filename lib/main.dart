import 'package:flutter/material.dart';
import 'pages/list.dart';

void main() {
  runApp(const ItineraryApp());
}

class ItineraryApp extends StatelessWidget {
  const ItineraryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summer 2021',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ItineraryListPage(title: 'Sneath Family Vacation'),
    );
  }
}
