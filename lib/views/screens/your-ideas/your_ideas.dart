import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/services/category_service.dart';
import 'package:idea_growr/views/screens/vision/vision.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';

class YourIdeas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('row $index'),
          onTap: () {
            CategoryService categoryService = new CategoryService();
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Vison(
                  categories: categoryService.getCategories(),
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
          Text('Suas Ideias'),
          Row(
            children: <Widget>[
              Icon(
                Icons.important_devices,
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
