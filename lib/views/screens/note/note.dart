import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';

//TODO:implement

class Note extends StatefulWidget {
  final IdeaModel idea;

  const Note({Key key, this.idea}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    return _buildContent();

    // return BlocBuilder<IdeaBloc, DefaultState>(
    //   bloc: _ideaBloc,
    //   builder: (BuildContext context, DefaultState state) {
    //     if (state is Loading) {
    //       return CustomCircularProgressIndicator();
    //     }

    //     if (state is IdeaInitial) {
    //       return _buildContent();
    //     }

    //     return Container();
    //   },
    // );
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
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Escrever nota'),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                iconSize: 30,
                color: AppColors.gray,
                onPressed: () {
                  _requestIdea();
                },
              ),
            ],
          )
        ],
      ),
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
            _requestIdea();
          },
        ),
      ),
    );
  }

  void _requestIdea() {
    // _ideaBloc.add(
    //   RequestIdea(
    //     _textEditingController.text,
    //     _textNoteEditingController.text,
    //     () {
    //       Navigator.pop(context, true);
    //     },
    //   ),
    // );
  }
}
