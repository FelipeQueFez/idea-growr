import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/views/screens/questions/bloc/category_bloc.dart';
import 'package:idea_growr/views/screens/questions/bloc/category_event.dart';
import 'package:idea_growr/views/screens/questions/bloc/category_state.dart';
import 'package:idea_growr/views/screens/questions/category_question.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';

class Category extends StatefulWidget {
  final CategoryModel category;
  final IdeaModel idea;

  const Category({Key key, @required this.category, @required this.idea})
      : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    _categoryBloc = getItInstance<CategoryBloc>();
    super.initState();
  }

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
          onTapCallback: () {
            _categoryBloc.add(SaveCategory(widget.idea));
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CategoryBloc, DefaultState>(
        bloc: _categoryBloc,
        builder: (BuildContext context, DefaultState state) {
          if (state is Loading) {
            return CircularProgressIndicator();
          }

          if (state is CategoryInitial) {
            return _buildContent();
          }

          if (state is Success) {
            //TODO:rever
            //Navigator.pop(context);
          }

          return Container();
        });
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: CustomContainer(
        child: Column(children: _buildQuestions()),
      ),
    );
  }

  List<Widget> _buildQuestions() {
    return widget.category.questions.map((item) {
      return CategoryQuestion(
          question: item, categoryId: widget.category.id, idea: widget.idea);
    }).toList();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.category.title),
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
