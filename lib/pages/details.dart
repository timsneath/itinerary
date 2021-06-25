import 'package:flutter/material.dart';
import '../models/event.dart';

class ItineraryDetailsPage extends StatefulWidget {
  final String title;
  final Event event;

  const ItineraryDetailsPage(
      {Key? key, required this.title, required this.event})
      : super(key: key);

  @override
  _ItineraryDetailsPageState createState() => _ItineraryDetailsPageState();
}

class _ItineraryDetailsPageState extends State<ItineraryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              const snackBar = SnackBar(content: Text('Save form'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.event), labelText: 'Event'),
              initialValue: widget.event.event,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.date_range), labelText: 'Start'),
                initialValue: widget.event.startDate.toString()),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.date_range), labelText: 'End'),
                initialValue: widget.event.endDate.toString()),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.location_city), labelText: 'Location'),
              initialValue: widget.event.location,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.link), labelText: 'URL'),
              initialValue: widget.event.url.toString(),
              maxLines: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.notes), labelText: 'Notes'),
              initialValue: widget.event.notes,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
