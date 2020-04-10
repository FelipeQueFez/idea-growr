import 'package:idea_growr/modules/user_answer/model/idea_model.dart';

class UserIdeasModel {
  final List<IdeaModel> ideas;

  UserIdeasModel({
    this.ideas,
  });

  UserIdeasModel.fromJsonMap(Map<String, dynamic> json)
      : ideas = json["ideas"] != null
            ? List<IdeaModel>.from(
                json["ideas"].map((it) => IdeaModel.fromJsonMap(it)))
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ideas'] =
        this.ideas != null ? this.ideas.map((it) => it.toJson()).toList() : [];
    return data;
  }
}
