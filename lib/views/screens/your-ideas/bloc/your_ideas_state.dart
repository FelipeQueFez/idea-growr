import 'package:flutter/material.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

@immutable
class YourIdeasState extends DefaultState {
  final List<IdeaModel> ideas;

  YourIdeasState({
    this.ideas,
  });

  factory YourIdeasState.initial() {
    return YourIdeasState(ideas: List());
  }

  @override
  List<Object> get props => [ideas];
}
