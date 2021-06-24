enum Category { travel, event, hotel, other }

class CategoryHelper {
  static Category fromString(String text) {
    switch (text.toLowerCase()) {
      case 'travel':
        return Category.travel;
      case 'event':
        return Category.event;
      case 'hotel':
        return Category.hotel;
      default:
        return Category.other;
    }
  }
}

class Event {
  final DateTime startDate;
  final DateTime endDate;
  final Category category;
  final String event;
  final String location;
  final Uri? url;
  final String notes;

  const Event(this.startDate, this.endDate, this.category, this.event,
      this.location, this.url, this.notes);
}
