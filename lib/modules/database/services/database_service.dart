import 'dart:convert';

import 'package:idea_growr/modules/database/providers/database_provider.dart';
import 'package:idea_growr/modules/shared/user/user_model.dart';
import 'package:idea_growr/modules/user_answer/model/user_ideas_model.dart';
import 'package:idea_growr/setup.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final DatabaseProvider provider;

  DatabaseService(this.provider);

  void insertIdeaAsync(String ideaTitle, String ideaDescription) async {
    var user = getItInstance.get<UserModel>();
    var db = getItInstance.get<Database>();
    var uuid = getItInstance.get<Uuid>();

    UserIdeasModel newIdea = new UserIdeasModel(
        ideaId: uuid.v1(),
        ideaTitle: ideaTitle,
        ideaDescription: ideaDescription);

    var result = await provider.selectUserIdDatabaseAsync(db, user.userId);

    if (result != null) {
      //TODO:in development - update
      String content = result["content"];
      content = content.replaceAll('\'', "\"");
      var map = json.decode(content);
      var ideaTest = UserIdeasModel.fromJsonMap(map);
      print('OK');
    } else {
      var jsonConvert = json.encode(newIdea.toJson());
      jsonConvert = jsonConvert.replaceAll("\"", "'");
      provider.insertDatabaseSync(db, user.userId, jsonConvert);
    }
  }
}
