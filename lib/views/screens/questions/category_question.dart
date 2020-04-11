import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/question_model.dart';
import 'package:idea_growr/modules/user_answer/model/answer_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class CategoryQuestion extends StatefulWidget {
  final QuestionModel question;
  final IdeaModel idea;
  final int categoryId;

  const CategoryQuestion(
      {Key key,
      @required this.categoryId,
      @required this.question,
      @required this.idea})
      : super(key: key);

  @override
  _CategoryQuestionState createState() => _CategoryQuestionState();
}

class _CategoryQuestionState extends State<CategoryQuestion> {
  TextEditingController _textEditingController = TextEditingController();
  Timer _textValueDebounce;

  @override
  void initState() {
    _textEditingController.addListener(_onTextChange);
    _setInitialValue();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_onTextChange);
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildQuestion(widget.question),
    );
  }

  void _setInitialValue() {
    var result = widget.idea.answers.firstWhere(
        (item) =>
            item.questionId == widget.question.id &&
            item.categoryId == widget.categoryId,
        orElse: () => null);

    if (result != null) _textEditingController.text = result.answer;
  }

  void _onTextChange() {
    //if (_currentState == null) return;

    if (_textValueDebounce?.isActive ?? false) _textValueDebounce.cancel();

    _textValueDebounce = Timer(const Duration(milliseconds: 300), () {
      var answer = widget.idea.answers.firstWhere(
          (item) =>
              item.questionId == widget.question.id &&
              item.categoryId == widget.categoryId,
          orElse: () => null);

      if (answer != null) {
        answer.answer = _textEditingController.text;
      } else {
        AnswerModel newAnswer = new AnswerModel(
            categoryId: widget.categoryId,
            questionId: widget.question.id,
            answer: _textEditingController.text);
        widget.idea.answers.add(newAnswer);
      }
    });
  }

  List<Widget> _buildQuestion(QuestionModel model) {
    return [
      Text(
        model.title,
        style: TextStyle(
            color: AppColors.silver, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SpacerBox.v4,
      TextFormField(
        controller: _textEditingController,
        keyboardType: TextInputType.multiline,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: model.hintText,
          hintMaxLines: 10,
          hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      SpacerBox.v20,
    ];
  }
}
