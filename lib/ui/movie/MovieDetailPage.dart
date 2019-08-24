import 'package:flutter/material.dart';
import 'package:playdouban/http/ApiConfig.dart';
import 'package:playdouban/http/NetTools.dart';
import 'package:playdouban/model/MovieHot.dart';
import 'package:playdouban/res/CustomColors.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  TabBar _tabBar;
  TabController _tabController;

  // 电影数量
  int movieCount = 0;

  // 影院热映
  List<Subjects> hotMovieList = new List();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabBar = TabBar(
      tabs: [
        Tab(
          text: "影院热映",
        ),
        Tab(
          text: "即将上映",
        )
      ],
      indicatorColor: CustomColors.color_383838,
      indicatorWeight: 2,
      isScrollable: true,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(
        fontSize: 18,
      ),
      // label：指示器宽度跟字体长度一致
      indicatorSize: TabBarIndicatorSize.label,
      controller: _tabController,
      onTap: (index) {},
    );
    _getMovieHot();
  }

  ///
  /// 获取热门电影
  ///
  void _getMovieHot() {
    NetTools.get(ApiConfig.URL_MOVIE_HOT, (data) {
      if (data != null) {
        MovieHot movieHot = MovieHot.fromJson(data);
        if (movieHot != null) {
          setState(() {
            this.movieCount = movieHot.total;
            this.hotMovieList.addAll(movieHot.subjects);
          });
        }
      }
    }, errorCallBack: (msg) {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: HotSoonWidget(),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              Subjects subjects = hotMovieList[index];
              return Image.network(
                subjects.images.large,
                width: 100,
              );
            },childCount: hotMovieList.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ],
    );
  }

  ///
  /// 影院热映和即将上映控件
  ///
  Widget HotSoonWidget() {
    // 使用Column嵌套Row，这样指示器布局就能从头显示
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _tabBar,
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
        Padding(
          child: Divider(
            height: 0.33,
            color: CustomColors.color_383838,
          ),
          padding: EdgeInsets.only(left: 16, right: 16),
        ),
      ],
    );
  }
}
