import 'package:flutter/material.dart';
import 'package:itinerary/pages/details.dart';

import '../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const FlutterLogo(size: 56),
        title: Text(event.event),
        subtitle: Text(event.startDate.toString()),
        trailing: GestureDetector(
          child: const Icon(Icons.read_more),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ItineraryDetailsPage(title: event.event, event: event)),
            );
          },
        ),
      ),
    );
  }
}
