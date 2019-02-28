import 'package:flutter/material.dart';

//temply show one UI
class TweetsListPage extends StatelessWidget {
//hotnTweets data
  List hotTweetsList = [];

//common Tweets data
  List normalTweetsList = [];

  // Tweets author's textStyle , 作者文本样式
  TextStyle authorTextStyle;

  // Tweets time's textStyle ,动弹时间文本样式
  TextStyle subtitleStyle;

  // screen width
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    // get screen width :
    screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        //todo 大概是一个tabViewController ，类似原生viewpagercontroller
        length: 2,
        child: Scaffold(
          appBar: TabBar(tabs: <Widget>[
            Tab(
              text: 'Twetts List',
            ),
            Tab(
              text: 'Hot Tweets ',
            ),
          ]),
          body: TabBarView(
              children: <Widget>[getNormalListView(), getHotListView()]),
        ));
  }

  getNormalListView() {
    return ListView.builder(
        itemCount: normalTweetsList.length * 2 - 1, //含分割线
        itemBuilder: (context, i) => renderNormalRow());
  }

  getHotListView() {
    return ListView.builder(
        itemCount: hotTweetsList.length * 2 - 1, //含分割线
        itemBuilder: (context, i) => renderHotRow());
  }

  renderNormalRow(i) {
    //注意这个i参数类型不写
    //如果奇数 分割线
    if (i.isOdded) {
      return Divider(
        height: 1.0,
      );
    } else {

      i=i~/2;
      return getRowWidget(hotTweetsList[i]);
    }
  }

  renderHotRow() {}

  getRowWidget(hotTweetsList) {}
}
