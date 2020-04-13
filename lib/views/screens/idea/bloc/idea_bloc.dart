import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_event.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_state.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

class IdeaBloc extends Bloc<IdeaEvent, DefaultState> {
  final DatabaseService databaseService;

  IdeaBloc(this.databaseService);

  @override
  IdeaInitial get initialState => IdeaInitial.initial();

  @override
  Stream<DefaultState> mapEventToState(
    IdeaEvent event,
  ) async* {
    if (event is RequestIdea) {
      yield Loading();

      await Future.delayed(const Duration(seconds: 1), () => "1");

      await databaseService.insertIdeaAsync(event.title, event.description);

      yield IdeaInitial();

      event.successCallback();
    }
  }
}
