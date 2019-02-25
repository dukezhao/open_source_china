import 'package:flutter/material.dart';
import 'package:open_source_china/pages/TodoDetailsPage.dart';
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
    *//* return Center(

      //并非真正的list中item跳转，只是一个按钮
     *//* *//* child: RaisedButton(child: Text('to DetailPage'),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){//push的参数是一个Route对象，
          // 这里使用了Flutter提供的MaterialPageRoute对象，builder参数是一个方法，返回的就是详情页对象。
          return NewsDetailsPage();
        }));


      },),*//*

    //todo 还不是真的list 中item click ->details，只是把push里的东西放到一个路由表_route里
    //即，除了使用上面的方式做页面的跳转外，还可以给MaterialApp配置一个route参数，该route参数类似于一个全局的路
    // 由表，根据一个name值导航到对应的页面，这种方式需要定义一个类型为Map<String, WidgetBuilder>的变量_route
    // 变量，并在initDate()方法中为这个变量赋值，如下代码：
    // initDate();
    *//*   return Center(
              child: RaisedButton(child: Text('to DetailPage'),
        onPressed: (){

          Navigator.of(context).pushNamed('newsDetail');
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage('bbb pramaters ')));
        },
      )


    );*//*

    //change to  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage('bbb pramaters ')));
    // will be ok，but no use the _route defined .

*//*  return MaterialApp(
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
    );*//*

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
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
*/


//osc项目：资讯列表页面

class NewsListPage extends StatelessWidget {

  // 轮播图的数据
  var slideData = [];
  // 列表的数据（轮播图数据和列表数据分开，但是实际上轮播图和列表中的item同属于ListView的item）
  var listData = [];

  @override
  Widget build(BuildContext context) {


  }
}

