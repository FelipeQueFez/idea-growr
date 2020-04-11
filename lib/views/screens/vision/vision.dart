import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/screens/questions/category.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';

class Vison extends StatelessWidget {
  final List<CategoryModel> categories;
  final IdeaModel idea;

  const Vison({Key key, @required this.categories, @required this.idea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index].title),
          trailing: Icon(Icons.edit),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Category(
                  idea: idea,
                  category: categories[index],
                  saveChanges: (idea) {
                    print('save 2');
                  },
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Visão Global'),
          Row(
            children: <Widget>[
              Icon(
                Icons.restore_from_trash,
                size: 30,
                color: AppColors.gray,
              ),
              Icon(
                Icons.share,
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
