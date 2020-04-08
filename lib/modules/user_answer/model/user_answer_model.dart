import 'package:idea_growr/modules/user_answer/model/answer_model.dart';

class UserAnswerModel {
  final String userId;
  final List<AnswerModel> answers;

  UserAnswerModel({this.userId, this.answers});

  UserAnswerModel.fromJsonMap(Map<String, dynamic> json)
      : userId = json['userId'],
        answers = List<AnswerModel>.from(
            json["answers"].map((it) => AnswerModel.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['answers'] = this.answers.map((it) => it.toJson()).toList();
    return data;
  }
}
