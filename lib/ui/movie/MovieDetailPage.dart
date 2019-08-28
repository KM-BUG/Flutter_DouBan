import 'package:flutter/material.dart';
import 'package:playdouban/http/ApiConfig.dart';
import 'package:playdouban/http/NetTools.dart';
import 'package:playdouban/model/MovieHot.dart';
import 'package:playdouban/res/CustomColors.dart';
import 'package:playdouban/res/TextString.dart';
import 'package:playdouban/widget/RatingBar.dart';

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

  // 当前选中的Tab
  int _selectIndex = 0;

  // 电影数量
  int movieCount = 0;

  // 影院热映,即将上映电影
  List<Subjects> movieList = new List();

  // 宽高比例
  double ratio = 0.6;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabBar = TabBar(
      tabs: [
        Tab(
          text: TextString.text_hot_movie,
        ),
        Tab(
          text: TextString.text_movie_soon,
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
      onTap: (index) {
        _selectIndex = index;
        if (index == 0) {
          _getMovieHot();
        } else if (index == 1) {
          _getMovieSoon();
        }
      },
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
            if (_selectIndex == 0) {
              this.movieCount = movieHot.total;
              ratio = 0.6;
            }
            if (movieList.isNotEmpty) {
              movieList.clear();
            }
            this.movieList.addAll(movieHot.subjects.sublist(0, 6));
          });
        }
      }
    }, errorCallBack: (msg) {});
  }

  ///
  /// 即将上映的电影
  ///
  void _getMovieSoon() {
    NetTools.get(ApiConfig.URL_MOVIE_SOON, (data) {
      if (data != null) {
        MovieHot movieHot = MovieHot.fromJson(data);
        if (movieHot != null) {
          setState(() {
            if (_selectIndex == 1) {
              this.movieCount = movieHot.total;
              ratio = 0.5;
              if (movieList.isNotEmpty) {
                movieList.clear();
              }
              this.movieList.addAll(movieHot.subjects.sublist(0, 6));
            }
          });
        }
      }
    }, errorCallBack: (msg) {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: HotSoonWidget(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                Subjects subjects = movieList[index];
                if (_selectIndex == 0) {
                  return _getHotMovieItem(subjects);
                } else {
                  return _getMovieSoonItem(subjects);
                }
              }, childCount: movieList.length ??= 0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  // GridView的item的宽度和高度的比例
                  childAspectRatio: ratio,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  // GridView的每个item的宽度
                  maxCrossAxisExtent: (width - 32) / 3)),
        )
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

  ///
  /// 影院热映列表Item
  ///
  Widget _getHotMovieItem(Subjects subjects) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              // 带圆角的图片
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(subjects.images.large),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(4)),
              ),
              // 收藏图标
              Image.asset(
                "images/ic_subject_mark_add.png",
                width: 25,
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              subjects.title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              softWrap: false,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                RatingBar(subjects.rating.average, 0, 1),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    subjects.rating.average.toString(),
                    style: TextStyle(
                        fontSize: 11, color: CustomColors.color_808080),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///
  /// 即将上映列表Item
  ///
  Widget _getMovieSoonItem(Subjects subjects) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              // 带圆角的图片
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(subjects.images.large),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(4)),
              ),
              // 收藏图标
              Image.asset(
                "images/ic_subject_mark_add.png",
                width: 25,
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              subjects.title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              softWrap: false,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              subjects.collectCount.toString() + "人想看",
              style: TextStyle(fontSize: 11, color: CustomColors.color_808080),
              softWrap: false,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Container(
              decoration: BoxDecoration(
                  border: new Border.all(
                      color: CustomColors.color_e55477,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(2)),
              child: Text(
                subjects.mainlandPubdate,
                style:
                    TextStyle(fontSize: 10, color: CustomColors.color_e55477),
              ),
            ),
          )
        ],
      ),
    );
  }
}
