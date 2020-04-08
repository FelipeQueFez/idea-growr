import 'package:get_it/get_it.dart';
import 'package:idea_growr/modules/database/providers/database_provider.dart';
import 'package:idea_growr/modules/database/services/database_service.dart';
import 'package:idea_growr/modules/shared/user/user_model.dart';
import 'package:uuid/uuid.dart';

GetIt getItInstance = GetIt.instance;

Future setup() async {
  getItInstance.allowReassignment = true;

  _registerSingletonProviders();
  _registerSingletonServices();
  _registerBlocs();
}

void _registerSingletonProviders() {
  getItInstance
      .registerLazySingleton<DatabaseProvider>(() => DatabaseProvider());
}

void _registerSingletonServices() {
  //TODO:mock
  UserModel userModel = new UserModel(userId: "123");
  getItInstance.registerSingleton(userModel);
  getItInstance.registerLazySingleton<Uuid>(() => Uuid());

  getItInstance.registerLazySingleton<DatabaseService>(
      () => DatabaseService(getItInstance()));
}

void _registerBlocs() {}
