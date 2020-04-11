import 'package:flutter/material.dart';

@immutable
abstract class IdeaEvent {}

class RequestIdea extends IdeaEvent {
  final String title;
  final String description;

  RequestIdea(this.title, this.description);
}
