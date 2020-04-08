class AnswerModel {
  final int categoryId;
  final int questionId;
  final String answer;

  AnswerModel({this.categoryId, this.questionId, this.answer});

  AnswerModel.fromJsonMap(Map<String, dynamic> json)
      : categoryId = json['categoryId'],
        questionId = json['questionId'],
        answer = json['answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['questionId'] = this.questionId;
    data['answer'] = this.answer;

    return data;
  }
}
