import 'package:flutter/material.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

@immutable
class CategoryInitial extends DefaultState {
  CategoryInitial();

  factory CategoryInitial.initial() {
    return CategoryInitial();
  }

  @override
  List<Object> get props => [];
}
