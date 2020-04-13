import 'package:get_it/get_it.dart';
import 'package:idea_growr/modules/category/services/category_service.dart';
import 'package:idea_growr/modules/database/providers/database_provider.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';
import 'package:idea_growr/modules/shared/user/user_model.dart';
import 'package:idea_growr/views/screens/home/bloc/home_bloc.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_bloc.dart';
import 'package:idea_growr/views/screens/questions/bloc/category_bloc.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_bloc.dart';
import 'package:uuid/uuid.dart';

GetIt getItInstance = GetIt.instance;

Future setup() async {
  getItInstance.allowReassignment = true;

  _registerSingletonModels();
  _registerSingletonProviders();
  _registerSingletonServices();
  _registerBlocs();
}

void _registerSingletonModels() {
  //TODO:mock
  UserModel userModel = new UserModel(userId: "123");
  getItInstance.registerSingleton(userModel);
}

void _registerSingletonProviders() {
  getItInstance
      .registerLazySingleton<DatabaseProvider>(() => DatabaseProvider());
}

void _registerSingletonServices() {
  getItInstance.registerLazySingleton<Uuid>(() => Uuid());
  getItInstance.registerLazySingleton<CategoryService>(() => CategoryService());

  getItInstance.registerLazySingleton<DatabaseService>(
      () => DatabaseService(getItInstance(), getItInstance()));
}

void _registerBlocs() {
  getItInstance.registerLazySingleton<YourIdeasBloc>(() => YourIdeasBloc(getItInstance()));
  getItInstance.registerLazySingleton<IdeaBloc>(() => IdeaBloc(getItInstance()));
  getItInstance.registerLazySingleton<CategoryBloc>(() => CategoryBloc(getItInstance()));
  getItInstance.registerLazySingleton<HomeBloc>(() => HomeBloc(getItInstance()));
}
