import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/sheets.dart';
import '../widgets/itinerarylistview.dart';

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
      body: FutureBuilder<List<Event>>(
        future: GoogleSheet.getItinerary(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ItineraryListView(itinerary: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
