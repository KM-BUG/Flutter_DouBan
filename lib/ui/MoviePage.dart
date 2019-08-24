import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';
import 'package:playdouban/res/TextString.dart';
import 'package:playdouban/ui/movie/MovieDetailPage.dart';

import 'movie/HotSoonWidget.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieState();
  }
}

///
/// 实现SingleTickerProviderStateMixin来实现TabBar和TabBarView的联动
///
class MovieState extends State<MoviePage> with SingleTickerProviderStateMixin {
  TabController _tabController = null;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          TextString.text_movie_page,
          style: TextStyle(
            fontSize: 16,
            color: CustomColors.color_000000,
          ),
        ),
        centerTitle: true,
        // 标题栏下面阴影的高度
        elevation: 1,
        backgroundColor: CustomColors.color_ffffff,
        actions: <Widget>[
          // 搜索按钮
          IconButton(
              icon: Icon(
                Icons.search,
                color: CustomColors.color_4fca4f,
              ),
              onPressed: null),
          // 聊天
          IconButton(
              icon: Icon(
                Icons.message,
                color: CustomColors.color_4fca4f,
              ),
              onPressed: null)
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: TextString.text_movie,
            ),
            Tab(
              text: TextString.text_tv,
            ),
            Tab(
              text: TextString.text_book,
            ),
            Tab(
              text: TextString.text_city,
            ),
            Tab(
              text: TextString.text_music,
            ),
            Tab(
              text: TextString.text_street,
            )
          ],
          controller: _tabController,
          isScrollable: true,
          // 指示器颜色
          indicatorColor: CustomColors.color_383838,
          // 指示器高度
          indicatorWeight: 2,
          unselectedLabelStyle: TextStyle(fontSize: 16),
          labelStyle: TextStyle(fontSize: 16),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          // 电影
          MovieDetailPage(),
          new Center(
            child: Text("电视"),
          ),
          new Center(
            child: Text("书籍"),
          ),
          new Center(
            child: Text("同城"),
          ),
          new Center(
            child: Text("音乐"),
          ),
          new Center(
            child: Text("市集"),
          ),
        ],
        controller: _tabController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
