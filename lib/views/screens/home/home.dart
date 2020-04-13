import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/views/screens/home/bloc/home_bloc.dart';
import 'package:idea_growr/views/screens/home/bloc/home_state.dart';
import 'package:idea_growr/views/screens/home/bloc/home_event.dart';
import 'package:idea_growr/views/screens/idea/idea.dart';
import 'package:idea_growr/views/screens/your-ideas/your_ideas.dart';
import 'package:idea_growr/views/shared/bloc/DefaultState.dart';
import 'package:idea_growr/views/shared/custom_card.dart';
import 'package:idea_growr/views/shared/custom_circular_progress_indicador.dart';
import 'package:idea_growr/views/shared/custom_container.dart';
import 'package:idea_growr/views/shared/custom_scaffold.dart';
import 'package:idea_growr/views/shared/custom_text.dart';
import 'package:idea_growr/views/shared/extend_text.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = getItInstance<HomeBloc>()..add(LoadIdeas());
    super.initState();
  }

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
              //TODO:implement
              // Icon(
              //   Icons.file_upload,
              //   size: 30,
              //   color: AppColors.gray,
              // ),
              // SpacerBox.h15,
              // Icon(
              //   Icons.home,
              //   size: 30,
              //   color: AppColors.gray,
              // ),
              // SpacerBox.h15,
              // Icon(
              //   Icons.collections,
              //   size: 30,
              //   color: AppColors.gray,
              // ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, DefaultState>(
      bloc: _homeBloc,
      builder: (BuildContext context, DefaultState state) {
        if (state is Loading) {
          return CustomCircularProgressIndicator();
        }

        if (state is HomeState) {
          return _buildContent(state.countIdeas);
        }

        return Container();
      },
    );
  }

  Widget _buildContent(int countIdeas) {
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
              onTapCallback: () async {
                bool refresh = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Idea()),
                );

                if (refresh != null && refresh) {
                  _homeBloc.add(LoadIdeas());
                }
              },
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
                'Suas ideias ($countIdeas)',
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              onTapCallback: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourIdeas()),
                );
              },
            ),
            // CustomCard(
            //   backgroundColor: AppColors.white,
            //   icon: Icons.chat,
            //   title: ExtendsText(
            //     'Encontrar músicos',
            //     color: AppColors.primary,
            //     fontWeight: FontWeight.normal,
            //   ),
            // ),
            // CustomCard(
            //   backgroundColor: AppColors.white,
            //   icon: Icons.file_download,
            //   title: ExtendsText(
            //     'Usuário informa gostos de música, culinária, cultura etc... E o app busca lugares que combinam com os gostos dele.',
            //     color: AppColors.primary,
            //     fontWeight: FontWeight.normal,
            //   ),
            // ),
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
