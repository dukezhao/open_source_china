import 'package:flutter/material.dart';
import 'package:open_source_china/pages/DiscoveryPage.dart';
import 'package:open_source_china/pages/MyInfoPage.dart';
import 'package:open_source_china/pages/NewsDetailsPage.dart';

import 'package:open_source_china/pages/NewsListPage.dart';
import 'package:open_source_china/pages/TweetsListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_source_china/widget/MyDrawer.dart';

void main() => runApp(MyApp());

// MyApp是一个有状态的组件，因为页面标题，页面内容和页面底部Tab都会改变
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyOSCClientState();
}

//此类是一个状态类，
class MyOSCClientState extends State<MyApp> {
  //定义2个变量给 底部nagivatorationBar 即IndexedStack用,
  int _tabIndex = 0; //当前选中Tab's index

  var tabImages;
  final appBarTitles = ['News ', 'Animation', 'discovery', 'Member'];

  //Map<String, WidgetBuilder> _route;

/*  var _body = IndexedStack(
    children: <Widget>[
      //把四个页面加入，
      NewsListPage(),
      TweetsListPage(),
      DiscoveryPage(),
      MyInfoPage()
    ],
    index: _tabIndex, //todo ，应该是_tabIndex,不过报错， 说不能在初始化里访问， 暂时写0，index默认选中页。
    //_tabIndex报错的原因 不能放到这里，需要放到build方法里
  );*/

  final tabTextStyleSelected = TextStyle(color: Color(0xff63ca6c));
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  @override
  Widget build(BuildContext context) {
    initData(); //init bottomIcon's data
    //todo 位置还不能确定是否是这里，
    var _body = IndexedStack(
      children: <Widget>[
        //把四个页面加入，
        NewsListPage(),
        TweetsListPage(),
        DiscoveryPage(),
        MyInfoPage()
      ],
      index: _tabIndex,
    );

    return new MaterialApp(
      theme: new ThemeData(
          // 设置页面的主题色
          primaryColor: const Color(0xFF63CA6C)),
      home: new Scaffold(
        appBar: new AppBar(
            // 设置AppBar标题
            title: new Text("Real OSC",
                // 设置AppBar上文本的样式
                style: new TextStyle(color: Colors.white)),
            // 设置AppBar上图标的样式
            iconTheme: new IconThemeData(color: Colors.white)),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: getBottomNavItems(),
          currentIndex: _tabIndex,
          onTap: (index) {
            //bottom tabItem click issue ,click to change the tab's index, refresh the page ,
            setState(() {
              _tabIndex = index;
            });
          },
        ),

        //由于TabItem是由一个图标和一个文本组件构成，所以这里还需要在MyOSCClientState类中定
        // 义两个变量tabImages和appBarTitles。tabImages是一个二维数组，表示TabItem中的图标
        // （包括选中和未选中状态的图标），appBarTitles是一个字符串数组，表示每个TabItem对应的
        // 页面标题，这两个变量的赋值代码，见上

        //drawer属性用于为当前页面添加一个侧滑菜单,Center这里只是占位，
        /*    drawer: Drawer(
          child: new Center(
            child: Text('this is a Drawer'),
          ),
        ),*/

        //real drawer ,
        drawer: MyDrawer(),//已经ok
      ),


     /* 一般写法：*/

      routes: <String, WidgetBuilder>{
        'newsDetail': (_) => NewsDetailsPage("mainsetrouter,list跳转 来的详情页")
      },

      //另一种写法，跳转Ok
      /*routes: <String,WidgetBuilder>{'newsDetail': (context) {return  NewsDetailsPage();}},*/
    );
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  getTabTitle(int i) {
    return Text(appBarTitles[i], style: getTabTextStyle(i));
  }

  TextStyle getTabTextStyle(int i) {
    //i is the index
    if (i == _tabIndex) {
      return tabTextStyleSelected;
    }

    {
      return tabTextStyleNormal;
    }
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(
          BottomNavigationBarItem(icon: getTabIcon(i), title: getTabTitle(i)));
    }

    return list;
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  Image getTabImage(String path) {
    return Image.asset(
      path,
      width: 20.0,
      height: 20.0,
    );
  }
}
