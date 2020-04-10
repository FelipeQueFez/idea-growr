import 'dart:convert';

import 'package:idea_growr/modules/database/providers/database_provider.dart';
import 'package:idea_growr/modules/shared/user/user_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
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

    IdeaModel newIdea = new IdeaModel(
        ideaId: uuid.v1(),
        ideaTitle: ideaTitle,
        ideaDescription: ideaDescription);

    var result = await provider.selectUserIdDatabaseAsync(db, user.userId);

    if (result != null) {
      String content = result["content"];
      content = content.replaceAll('\'', "\"");

      var map = json.decode(content);
      var currentUserIdeas = UserIdeasModel.fromJsonMap(map);

      currentUserIdeas.ideas.add(newIdea);
      var jsonConvert = _objectIdeasToString(currentUserIdeas);

      provider.updateUserIdDatabaseAsync(db, user.userId, jsonConvert);
    } else {
      UserIdeasModel userIdeas = new UserIdeasModel(ideas: List());
      userIdeas.ideas.add(newIdea);
      var jsonConvert = _objectIdeasToString(userIdeas);
      provider.insertDatabaseSync(db, user.userId, jsonConvert);
    }
  }

  String _objectIdeasToString(UserIdeasModel ideas) {
    var jsonConvert = json.encode(ideas.toJson());
    jsonConvert = jsonConvert.replaceAll("\"", "'");
    return jsonConvert;
  }
}
