import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/views/shared/spacer_box.dart';

class CustomCard extends StatelessWidget {
  final Text title;
  final IconData icon;
  final Color backgroundColor;

  const CustomCard({Key key, this.title, this.icon, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            color: Color.fromRGBO(0, 0, 0, .05),
          ),
        ],
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Icon(
                  icon,
                  size: 30,
                  color: AppColors.gray,
                ),
              ),
              SpacerBox.h10,
              title
            ],
          ),
        ),
      ),
    );
  }
}
