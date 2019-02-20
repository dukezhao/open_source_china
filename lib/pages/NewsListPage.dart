import 'package:flutter/material.dart';
import 'NewsDetailsPage.dart';

//temply show one UI
class NewsListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(child: Text('to DetailPage'),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){//push的参数是一个Route对象，
          // 这里使用了Flutter提供的MaterialPageRoute对象，builder参数是一个方法，返回的就是详情页对象。
          return NewsDetailsPage();
        }));


      },),
    );
  }
}