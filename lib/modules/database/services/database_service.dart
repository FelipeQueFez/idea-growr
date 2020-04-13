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
  final UserModel userModel;

  DatabaseService(this.provider, this.userModel);

  Future insertIdeaAsync(String ideaTitle, String ideaDescription) async {
    var uuid = getItInstance<Uuid>();
    var db = await _instanceDatabaseAsync();

    IdeaModel newIdea = new IdeaModel(
        ideaId: uuid.v1(),
        ideaTitle: ideaTitle,
        ideaDescription: ideaDescription);

    var result = await provider.selectUserIdDatabaseAsync(db, userModel.userId);

    if (result != null) {
      var currentUserIdeas = _stringToObject(result);

      currentUserIdeas.ideas.add(newIdea);
      var jsonConvert = _objectIdeasToString(currentUserIdeas);

      provider.updateUserIdDatabaseAsync(db, userModel.userId, jsonConvert);
    } else {
      UserIdeasModel userIdeas = new UserIdeasModel(ideas: List());
      userIdeas.ideas.add(newIdea);
      var jsonConvert = _objectIdeasToString(userIdeas);
      provider.insertDatabaseSync(db, userModel.userId, jsonConvert);
    }
  }

  Future updateIdeaAsync(IdeaModel idea) async {
    var db = await _instanceDatabaseAsync();
    var result = await provider.selectUserIdDatabaseAsync(db, userModel.userId);
    var currentUserIdeas = _stringToObject(result);

    currentUserIdeas.ideas.removeWhere((item) => item.ideaId == idea.ideaId);
    currentUserIdeas.ideas.add(idea);

    var jsonConvert = _objectIdeasToString(currentUserIdeas);

    provider.updateUserIdDatabaseAsync(db, userModel.userId, jsonConvert);
  }

  Future<UserIdeasModel> selectedIdeasAsync() async {
    var db = await _instanceDatabaseAsync();
    var result = await provider.selectUserIdDatabaseAsync(db, userModel.userId);
    UserIdeasModel currentUserIdeas;

    if (result != null)
      currentUserIdeas = _stringToObject(result);
    else
      currentUserIdeas = new UserIdeasModel(ideas: List());

    return currentUserIdeas;
  }

  Future<Database> _instanceDatabaseAsync() async {
    if (getItInstance.isRegistered<Database>()) {
      return getItInstance<Database>();
    } else {
      return provider.openDatabaseAsync();
    }
  }

  String _objectIdeasToString(UserIdeasModel ideas) {
    var jsonConvert = json.encode(ideas.toJson());
    jsonConvert = jsonConvert.replaceAll("\"", "'");
    return jsonConvert;
  }

  UserIdeasModel _stringToObject(Map<String, dynamic> result) {
    String content = result["content"];
    content = content.replaceAll('\'', "\"");

    var map = json.decode(content);
    var currentUserIdeas = UserIdeasModel.fromJsonMap(map);

    return currentUserIdeas;
  }
}
