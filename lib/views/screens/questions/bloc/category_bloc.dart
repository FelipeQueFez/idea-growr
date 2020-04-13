import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';

import 'package:idea_growr/views/screens/questions/bloc/category_event.dart';
import 'package:idea_growr/views/screens/questions/bloc/category_state.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';

class CategoryBloc extends Bloc<CategoryEvent, DefaultState> {
  final DatabaseService databaseService;

  CategoryBloc(this.databaseService);

  @override
  DefaultState get initialState => CategoryInitial.initial();

  @override
  Stream<DefaultState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is SaveCategory) {
      yield Loading();

      await Future.delayed(const Duration(seconds: 1), () => "1");

      await databaseService.updateIdeaAsync(event.idea);

      yield CategoryInitial();

      event.successCallback();
    }
  }
}
