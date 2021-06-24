import 'package:flutter/material.dart';

class ItineraryDetailsPage extends StatefulWidget {
  final String title;

  const ItineraryDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  _ItineraryDetailsPageState createState() => _ItineraryDetailsPageState();
}

class _ItineraryDetailsPageState extends State<ItineraryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
