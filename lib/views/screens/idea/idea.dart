import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_bloc.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_event.dart';
import 'package:idea_growr/views/screens/idea/bloc/idea_state.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_circular_progress_indicador.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class Idea extends StatefulWidget {
  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  IdeaBloc _ideaBloc;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textNoteEditingController = TextEditingController();

  @override
  void initState() {
    _ideaBloc = getItInstance<IdeaBloc>();
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
            'Salvar',
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          onTapCallback: () {
            _ideaBloc.add(RequestIdea(
                _textEditingController.text, _textNoteEditingController.text));
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Criar ideia'),
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

  Widget _buildBody() {
    return BlocBuilder<IdeaBloc, DefaultState>(
      bloc: _ideaBloc,
      builder: (BuildContext context, DefaultState state) {
        if (state is IdeaInitial) {
          return _buildContent();
        }

        if (state is Loading) {
          return CustomCircularProgressIndicator();
        }

        if (state is Success) {
          //TODO:rever
          //Navigator.pop(context);
        }

        return Container();
      },
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: CustomContainer(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Dê um nome a sua ideia',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SpacerBox.v20,
            TextFormField(
              maxLines: 10,
              controller: _textNoteEditingController,
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Anote sua ideia',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
