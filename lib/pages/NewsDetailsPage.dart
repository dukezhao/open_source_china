import 'package:flutter/material.dart';

/*
*
	1. 在build方法中我们返回的是一个Scaffold组件，而不是像main.dart中那样返回一个MaterialApp组件，
	这是因为我们在使用Navigator从资讯列表页跳转到详情页时，会自动为详情页的AppBar左边添加返回按钮，如果
	你在详情页还是使用MaterialApp对象，则页面左上角不会自动添加返回按钮。
	2.
上面代码中的body部分返回的是一个Center组件，Center中装的是Column组件，如果你不为Column组件设置mainAxisAlignment:
 MainAxisAlignment.center，则页面上的组件只会在水平方向居中而不会在垂直方向上居中。
	3.
使用Navigator.of(context).pop()来使页面返回到上一级。

*
* */

class NewsDetailsPage extends StatelessWidget {
  final title;
  NewsDetailsPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news details：',style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 28.0),),//'news detail page '->title
            RaisedButton(
              child: Text('back'),
            onPressed: (){
                Navigator.of(context).pop();//来使页面返回到上一级
            },),

          ],
        ),
      ),
    );
  }
}
