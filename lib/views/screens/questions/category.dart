import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/screens/questions/category_question.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';

class Category extends StatelessWidget {
  final CategoryModel category;
  final IdeaModel idea;

  const Category({Key key, @required this.category, @required this.idea}) : super(key: key);

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
      return CategoryQuestion(item: item);
    }).toList();
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
