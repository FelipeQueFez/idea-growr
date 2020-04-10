import 'package:idea_growr/modules/user_answer/model/answer_model.dart';

class IdeaModel {
  final String ideaId;
  final String ideaTitle;
  final String ideaDescription;
  final List<AnswerModel> answers;

  IdeaModel(
      {this.ideaId, this.ideaTitle, this.ideaDescription, this.answers});

  IdeaModel.fromJsonMap(Map<String, dynamic> json)
      : ideaId = json['ideaId'],
        ideaTitle = json['ideaTitle'],
        ideaDescription = json['ideaDescription'],
        answers = json["answers"] != null
            ? List<AnswerModel>.from(
                json["answers"].map((it) => AnswerModel.fromJsonMap(it)))
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ideaId'] = this.ideaId;
    data['ideaTitle'] = this.ideaTitle;
    data['ideaDescription'] = this.ideaDescription;
    data['answers'] = this.answers != null
        ? this.answers.map((it) => it.toJson()).toList()
        : [];
    return data;
  }
}
