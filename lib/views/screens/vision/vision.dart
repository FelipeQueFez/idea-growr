import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/views/screens/questions/category.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';

class Vison extends StatelessWidget {
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
          trailing: Icon(Icons.edit),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Category(title: index.toString(),)),
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