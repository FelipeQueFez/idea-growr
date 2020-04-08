import 'package:get_it/get_it.dart';
import 'package:idea_growr/modules/shared/user/user_model.dart';

GetIt getItInstance = GetIt.instance;

Future setup() async {
  getItInstance.allowReassignment = true;

  //TODO:mock
  UserModel userModel = new UserModel(userId: "123");
  getItInstance.registerSingleton(userModel);
}
