import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/category/services/category_service.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/views/screens/vision/vision.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_bloc.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_event.dart';
import 'package:idea_growr/views/screens/your-ideas/bloc/your_ideas_state.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/shared/custom_circular_progress_indicador.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';

class YourIdeas extends StatefulWidget {
  @override
  _YourIdeasState createState() => _YourIdeasState();
}

class _YourIdeasState extends State<YourIdeas> {
  YourIdeasBloc _yourIdeasBloc;
  CategoryService _categoryService;

  @override
  void initState() {
    _yourIdeasBloc = getItInstance<YourIdeasBloc>()..add(LoadIdeas());
    _categoryService = getItInstance<CategoryService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<YourIdeasBloc, DefaultState>(
      bloc: _yourIdeasBloc,
      builder: (BuildContext context, DefaultState state) {
        if (state is Loading) {
          return CustomCircularProgressIndicator();
        }
        if (state is YourIdeasState) {
          return ListView.separated(
            itemCount: state.ideas.length,
            itemBuilder: (context, index) {
              var idea = state.ideas[index];
              return ListTile(
                title: Text('${idea.ideaTitle}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Vison(
                        idea: idea,
                        categories: _categoryService.getCategories(),
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

        return Container();
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
