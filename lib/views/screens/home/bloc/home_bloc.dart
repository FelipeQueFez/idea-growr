import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/screens/home/bloc/home_event.dart';
import 'package:idea_growr/views/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, DefaultState> {
  final DatabaseService databaseService;

  HomeBloc(this.databaseService);

  @override
  DefaultState get initialState => HomeState.initial();

  @override
  Stream<DefaultState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadIdeas) {
      yield Loading();

      var result = await this.databaseService.selectedIdeasAsync();

      yield HomeState(countIdeas: result.ideas.length);
    }
  }
}
