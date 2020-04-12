import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/screens/home/bloc/home_event.dart';
import 'package:idea_growr/views/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, DefaultState> {
  @override
  DefaultState get initialState => HomeInitial();

  @override
  Stream<DefaultState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
