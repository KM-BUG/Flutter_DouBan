import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';

///
///找电影，豆瓣榜单，豆瓣猜，豆瓣片单子Widget
///
class TopIconWidget extends StatefulWidget {
  String imageName;
  String title;

  TopIconWidget(this.imageName, this.title);

  @override
  State<StatefulWidget> createState() => new TopIconState();
}

class TopIconState extends State<TopIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          widget.imageName,
          width: 47,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 13, color: CustomColors.color_808080),
          ),
        )
      ],
    );
  }
}
