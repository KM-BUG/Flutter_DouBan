import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';
import 'package:playdouban/res/TextString.dart';
import 'package:playdouban/ui/GroupPage.dart';
import 'package:playdouban/ui/HomePage.dart';
import 'package:playdouban/ui/MinePage.dart';
import 'package:playdouban/ui/MoviePage.dart';
import 'package:playdouban/ui/RadioPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩豆瓣',
      theme: ThemeData(
        primaryColor: CustomColors.color_4fca4f,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  // 当前首页的位置
  int currentIndex = 0;

  // 页面切换的控制器
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView(
        children: <Widget>[
          new HomePage(),
          new MoviePage(),
          new RadioPage(),
          new GroupPage(),
          new MinePage()
        ],
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // 禁止PageView左右滑动切换
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(TextString.text_home_page)),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie), title: Text(TextString.text_movie_page)),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio), title: Text(TextString.text_radio_page)),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work),
              title: Text(TextString.text_group_page)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text(TextString.text_mine_page))
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        // 底部导航的背景颜色
        backgroundColor: CustomColors.color_ffffff,
        // 底部导航Tab选中的颜色
        selectedItemColor: CustomColors.color_4fca4f,
        // 底部导航Tab未选中的颜色
        unselectedItemColor: CustomColors.color_a6a6a6,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: _onBottomTabChanged,
      ),
    );
  }

  ///
  /// 底部Tab点击切换
  ///
  void _onBottomTabChanged(index) {
    _pageController.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
