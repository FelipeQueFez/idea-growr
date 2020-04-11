import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/question_model.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class CategoryQuestion extends StatefulWidget {
  final QuestionModel item;

  const CategoryQuestion({Key key, this.item}) : super(key: key);

  @override
  _CategoryQuestionState createState() => _CategoryQuestionState();
}

class _CategoryQuestionState extends State<CategoryQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildQuestion(widget.item),
    );
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
        //controller: _textEditingController,
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
