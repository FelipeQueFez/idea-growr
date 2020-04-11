import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_event.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_state.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

class YourIdeasBloc extends Bloc<YourIdeasEvent, DefaultState> {
  final DatabaseService databaseService;

  YourIdeasBloc(this.databaseService);

  @override
  YourIdeasState get initialState => YourIdeasState.initial();

  @override
  Stream<DefaultState> mapEventToState(
    YourIdeasEvent event,
  ) async* {
    if (event is LoadIdeas) {
      yield Loading();

      await Future.delayed(const Duration(seconds: 1), () => "1");

      var currentIdeas = await databaseService.selectedIdeasAsync();

      yield YourIdeasState(ideas: currentIdeas.ideas);
    }
  }
}
