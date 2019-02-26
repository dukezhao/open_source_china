import 'package:flutter/material.dart';
import 'package:open_source_china/pages/TodoDetailsPage.dart';
import 'package:open_source_china/widget/SlideView.dart';
import 'NewsDetailsPage.dart';

//temply show one UI ,非osc 代码实现的， 最简单list及导航到details

/*class NewsListPage extends StatelessWidget {
  final todos = new List<Todo>.generate(
    20,
    (i) => new Todo(
        'Todo $i',
        'A description fo'
        ' what need to do be done for Todo $i '),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 */ /*    return Center(
      //并非真正的list中item跳转，只是一个按钮
       child: RaisedButton(child: Text('to DetailPage'),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){//push的参数是一个Route对象，
          // 这里使用了Flutter提供的MaterialPageRoute对象，builder参数是一个方法，返回的就是详情页对象。
          return NewsDetailsPage();
        }));


      },),
     );*/ /*
    //todo 还不是真的list 中item click ->details，只是把push里的东西放到一个路由表_route里
    //即，除了使用上面的方式做页面的跳转外，还可以给MaterialApp配置一个route参数，该route参数类似于一个全局的路
    // 由表，根据一个name值导航到对应的页面，这种方式需要定义一个类型为Map<String, WidgetBuilder>的变量_route
    // 变量，并在initDate()方法中为这个变量赋值，如下代码：
    // initDate();
       return Center(
              child: RaisedButton(child: Text('to DetailPage'),
        onPressed: (){

          Navigator.of(context).pushNamed('newsDetail');
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage('bbb pramaters ')));
        },
      )


    );

    //change to  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage('bbb pramaters ')));
    // will be ok，but no use the _route defined .

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsList',
      theme: ThemeData(primaryColor: Colors.blue),
      routes: <String,WidgetBuilder>{'newsDetail':(_)=>NewsDetailsPage("来自listPage Parameters")},
      home: Center(
        child: RaisedButton(child:Text('to detail'),onPressed: (){
         // Navigator.of(context).pushNamed('newsDetail');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage('bbb pramaters ')));
        }),
      ),
    );

    //test Todo class：refer：https://flutterchina.club/cookbook/navigation/passing-data/

    //1.list view completed
    return Center(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: ()   //2.click->detailsPage
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              TodoDetailsPage(todo:todos[index]//todos[index] as transfer parameters;
              ),
              ),
              );
            },
          );
        },
      ),
    );


  }
}*/

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

//osc项目：资讯列表页面
/*轮播图和列表的组合
上面实现了自定义的轮播图组件，下面就需要将这个组件和列表组合起来。
由于资讯列表的item布局稍微有些复杂，所以这里有必要进行拆分，整体上可以将item
分为左右两部分，左边展示了资讯标题，时间，评论数等信息，右边展示了资讯的图片。所
以整体是一个Row组件，而左边又是一个Column组件，Column组件的第一列是标题，第二
列又是一个Row组件，其中有时间、作者头像、评论数等信息。下面直接上NewsListPage
    .dart的代码，在代码中做详细的注释：*/

class NewsListPage extends StatelessWidget {
  // 轮播图的数据
  var slideData = [];

  // 列表的数据（轮播图数据和列表数据分开，但是实际上轮播图和列表中的item同属于ListView的item）
  var listData = [];

  //列表中咨询标题的样式
  TextStyle titleTextStyle = TextStyle(fontSize: 15.0);

  //时间文本的样式

  TextStyle subtitleStyle =
      TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  NewsListPage() {
    //data init,add some test data
    for (int i = 00; i < 3; i++) {
      Map map = new Map();

      //根据不同key放入不同value ,
      //轮播图的资讯标题
      map['title'] = 'python 之父透露退位隐情，与核心开发团队产生隔阂';

      //轮播图的详情URL
      map['detailUrl'] =
          'https://.oschina.net/news/98455/guido-van-rossum-resigns';

      // 轮播图的图片URL
      map['imgurl'] =
          'https://static.oschina.net/uploads/img/201807/30113144_1SRR.png';
      slideData.add(map);
    }

    for (int i = 0; i < 30; i++) {
      Map map = Map();
      //list item's title
      map['title'] = 'J2Cache 2.3.23 发布，支持 memcached 二级缓存';
      //list item author avatar URL
      map['authorImg'] =
          'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      //列表item的时间文本
      map['timeStr'] = '2018-2-26';
      //列表item的资讯图片
      map['thumb'] =
          'https://static.oschina.net/uploads/logo/j2cache_N3NcX.png';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length * 2 + 1,
        itemBuilder: (context, i) => renderRow(i));
  }

  //render method for list
  renderRow(int i) {
    //i=0, render the Ad Widget
    if (i == 0) {
      return Container(
        height: 100.0,
        child: SlideView(slideData),
      );
    }
    //i>0
    i -= 1; //make i from 0 to begin

    //take 2 branch, isOdd or not
    //1.isOdd
    if (i.isOdd) {
      return Divider(height: 1.0,);
    }
    i=i~/2;
    //得到列表item数据
    var itemData=listData[i];
    //title 's whole Row item
    var titleRow=Row(
      children: <Widget>[
        Expanded(child: Text(itemData['title'],style: titleTextStyle,),)
      ],
    );

    //the line of time included author's avartar,time ,and comment 's count ,
    var timeRow=Row(
      children: <Widget>[
        //avartar
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            //via specially make shape properity to make the image with circle shape

            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
          ),
        )
      ],

    )
  }
}
