import 'package:flutter/material.dart';
import '../models/event.dart';
import 'eventcard.dart';

class ItineraryListView extends StatelessWidget {
  final List<Event> itinerary;
  const ItineraryListView({Key? key, required this.itinerary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: itinerary.length,
        itemBuilder: (context, index) {
          return EventCard(event: itinerary[index]);
        },
      ),
    );
  }
}
