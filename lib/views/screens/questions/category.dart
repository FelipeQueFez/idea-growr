import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/category/models/question_model.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class Category extends StatelessWidget {
  final CategoryModel category;

  const Category({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: CustomCard(
          backgroundColor: AppColors.idea,
          icon: Icons.save,
          title: ExtendsText(
            'Salvar mudanças',
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          onTapCallback: () => print('salvar'),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: CustomContainer(
        child: Column(children: _buildQuestions()),
      ),
    );
  }

  List<Widget> _buildQuestions() {
    return category.questions.map((item) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildQuestion(item),
      );
    }).toList();
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

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(category.title),
          Row(
            children: <Widget>[
              Icon(
                Icons.save,
                size: 30,
                color: AppColors.gray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
