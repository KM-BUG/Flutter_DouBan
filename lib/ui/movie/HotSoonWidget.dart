import 'package:flutter/material.dart';
import 'package:playdouban/res/CustomColors.dart';

///
/// 电影（影院热映，即将上映）
///
class HotSoonWidget extends StatefulWidget {
  final hotSoonState = new _HotSoonState();

  @override
  State<StatefulWidget> createState() {
    return hotSoonState;
  }

  ///
  /// 设置电影数量
  ///
  void setMovieCount(int count) {
    print("电影数量：" + count.toString());
    hotSoonState.setMoiveCount(count);
  }
}

class _HotSoonState extends State<HotSoonWidget>
    with SingleTickerProviderStateMixin {
  TabBar _tabBar;
  TabController _tabController;

  // 电影数量
  int movieCount = 0;

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
  }

  ///
  /// 设置电影数量
  ///
  void setMoiveCount(int movieCount) {
    setState(() {
      print("电影数量2：" + movieCount.toString());
      this.movieCount = movieCount;
    });
  }

  @override
  Widget build(BuildContext context) {

  }
}
