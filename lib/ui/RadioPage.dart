
import 'package:flutter/material.dart';

///
/// 广播
///
class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RadioState();
  }
}

class RadioState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text("广播"),
    );
  }
}
