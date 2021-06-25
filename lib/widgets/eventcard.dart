import 'package:flutter/material.dart';

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
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
