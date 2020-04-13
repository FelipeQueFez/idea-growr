import 'package:flutter/material.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

@immutable
class HomeState extends DefaultState {

  final int countIdeas;

  HomeState({this.countIdeas});

  factory HomeState.initial() {
    return HomeState(
      countIdeas: 0
    );
  }

  @override
  List<Object> get props => [countIdeas];
}