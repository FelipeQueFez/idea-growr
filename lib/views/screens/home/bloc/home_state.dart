

import 'package:flutter/material.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

@immutable
class HomeInitial extends DefaultState {
  HomeInitial();

  factory HomeInitial.initial() {
    return HomeInitial();
  }

  @override
  List<Object> get props => [];
}