import 'package:flutter/material.dart';

class ItineraryEditPage extends StatefulWidget {
  final String title;

  const ItineraryEditPage({Key? key, required this.title}) : super(key: key);

  @override
  _ItineraryEditPageState createState() => _ItineraryEditPageState();
}

class _ItineraryEditPageState extends State<ItineraryEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
