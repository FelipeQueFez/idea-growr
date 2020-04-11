import 'package:flutter/material.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';

@immutable
abstract class CategoryEvent {}

class SaveCategory extends CategoryEvent {
  final IdeaModel idea;

  SaveCategory(this.idea);
}
