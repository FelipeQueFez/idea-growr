import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/screens/note/note.dart';
import 'package:idea_growr/views/screens/questions/category.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';

class Vison extends StatefulWidget {
  final List<CategoryModel> categories;
  final IdeaModel idea;

  const Vison({Key key, @required this.categories, @required this.idea})
      : super(key: key);

  @override
  _VisonState createState() => _VisonState();
}

class _VisonState extends State<Vison> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: CustomCard(
            backgroundColor: AppColors.idea,
            icon: Icons.people,
            title: ExtendsText(
              'Write note',
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            onTapCallback: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Note()),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.categories[index].title),
                trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Category(
                        idea: widget.idea,
                        category: widget.categories[index],
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Global Vision'),
          Row(
            children: <Widget>[
              //TODO:implement
              // Icon(
              //   Icons.restore_from_trash,
              //   size: 30,
              //   color: AppColors.gray,
              // ),
              // Icon(
              //   Icons.share,
              //   size: 30,
              //   color: AppColors.gray,
              // ),
            ],
          )
        ],
      ),
    );
  }
}
