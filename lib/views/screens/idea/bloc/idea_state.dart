import 'package:flutter/material.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

@immutable
class IdeaInitial extends DefaultState {
  IdeaInitial();

  factory IdeaInitial.initial() {
    return IdeaInitial();
  }

  @override
  List<Object> get props => [];
}
