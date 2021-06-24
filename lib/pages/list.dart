import 'package:flutter/material.dart';

class ItineraryListPage extends StatefulWidget {
  final String title;

  const ItineraryListPage({Key? key, required this.title}) : super(key: key);

  @override
  _ItineraryListPageState createState() => _ItineraryListPageState();
}

class _ItineraryListPageState extends State<ItineraryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
