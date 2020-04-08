import 'package:idea_growr/modules/category/models/question_model.dart';

class CategoryModel {
  final int id;
  final String title;
  final List<QuestionModel> questions;

  CategoryModel({this.id, this.title, this.questions});
}