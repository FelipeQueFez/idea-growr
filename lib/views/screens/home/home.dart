import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/custom_text.dart';
import 'package:idea_growr/views/shared/extend_text.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Idea Growr'),
          Row(
            children: <Widget>[
              Icon(
                Icons.file_upload,
                size: 30,
                color: AppColors.gray,
              ),
              SpacerBox.h15,
              Icon(
                Icons.home,
                size: 30,
                color: AppColors.gray,
              ),
              SpacerBox.h15,
              Icon(
                Icons.collections,
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
    return SingleChildScrollView(
      child: CustomContainer(
        child: Column(
          children: <Widget>[
            CustomCard(
              backgroundColor: AppColors.idea,
              icon: Icons.people,
              title: ExtendsText(
                'Criar ideia',
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomCard(
              backgroundColor: AppColors.primary,
              icon: Icons.camera,
              title: ExtendsText(
                'Escrever nota',
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpacerBox.v20,
            CustomCard(
              backgroundColor: AppColors.white,
              icon: Icons.chat,
              title: ExtendsText(
                'Suas ideias (14)',
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomCard(
              backgroundColor: AppColors.white,
              icon: Icons.chat,
              title: ExtendsText(
                'Encontrar músicos',
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            CustomCard(
              backgroundColor: AppColors.white,
              icon: Icons.file_download,
              title: ExtendsText(
                'Usuário informa gostos de música, culinária, cultura etc... E o app busca lugares que combinam com os gostos dele.',
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            SpacerBox.v20,
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                'Você tem dois minutos ?',
                color: AppColors.silver,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            CustomCard(
              backgroundColor: AppColors.white,
              icon: Icons.folder,
              title: ExtendsText(
                'Preenche o nosso formuário de feedback (Inglês)',
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomCard(
              backgroundColor: AppColors.white,
              icon: Icons.close,
              title: ExtendsText(
                'Desculpe, não há tempo para feedback',
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
