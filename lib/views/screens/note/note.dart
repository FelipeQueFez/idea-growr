import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/modules/shared/image_service.dart';
import 'package:idea_growr/modules/user_answer/model/idea_model.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/extend_text.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class Note extends StatefulWidget {
  final IdeaModel idea;

  const Note({Key key, this.idea}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController _textEditingController = TextEditingController();

  Widget cardImage;

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

    //TODO:implement
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
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Notes here',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SpacerBox.v20,
            RaisedButton(
              onPressed: () async {
                ImageService imageService = new ImageService();
                var file = await imageService.getImageAsync();
                if(file != null) {
                  cardImage = _buildCardImage(file);
                  setState(() {});
                }
              },
              child: Text('Photo from camera', style: TextStyle(fontSize: 20)),
            ),
            SpacerBox.v20,
            cardImage != null ? cardImage : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(File file) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Image.file(
            file,
            fit: BoxFit.fill,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Write note'),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                iconSize: 30,
                color: AppColors.gray,
                onPressed: () {
                  //_requestIdea();
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
            'Save',
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          onTapCallback: () {
            //_requestIdea();
          },
        ),
      ),
    );
  }

  //TODO:implement
  void _requestIdea() {
    final snackBar = SnackBar(content: Text('In development'));

    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
