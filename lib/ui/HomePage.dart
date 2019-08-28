import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Image(
      image: AssetImage("images/ic_subject_mark_add.png"),
      height: 20,
      width: 20,
    ));
  }
}
