import 'package:flutter/material.dart';

///
/// 我的
///
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }
}

class MineState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text("我的"),
    );
  }
}
