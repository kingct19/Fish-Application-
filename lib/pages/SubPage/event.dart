import 'package:flutter/foundation.dart';

class Event {
  final String title;
  Event({required this.title});

  @override
  // ignore: unnecessary_this
  String toString() => this.title;
}
