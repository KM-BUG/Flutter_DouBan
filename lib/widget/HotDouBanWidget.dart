import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';

typedef TabCallBack = void Function();

///
/// 标题+全部更多  Widget
///
class TitleBarMoreWidget extends StatefulWidget {
  TitleBarMoreState state = new TitleBarMoreState();
  String tabName;

  TitleBarMoreWidget(this.tabName, TabCallBack tabCallBack) {
    state.setTabCallBack(tabCallBack);
  }

  void setMovieCount(int movieCount) {
    state.setMovieCount(movieCount);
  }

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class TitleBarMoreState extends State<TitleBarMoreWidget> {
  TabCallBack _tabCallBack;
  int movieCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  widget.tabName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                "全部 $movieCount >",
                style: TextStyle(
                    fontSize: 12,
                    color: CustomColors.color_383838,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void setTabCallBack(TabCallBack tabCallBack) {
    this._tabCallBack = tabCallBack;
  }

  void setMovieCount(int movieCount) {
    setState(() {
      this.movieCount = movieCount;
    });
  }
}
