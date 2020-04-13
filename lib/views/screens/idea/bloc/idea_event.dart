import 'package:flutter/material.dart';

@immutable
abstract class IdeaEvent {}

class RequestIdea extends IdeaEvent {
  final String title;
  final String description;
  final Function successCallback;

  RequestIdea(this.title, this.description, this.successCallback);
}
