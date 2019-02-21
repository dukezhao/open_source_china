import 'package:flutter/material.dart';
import 'package:open_source_china/pages/NewsListPage.dart';

/**
 * this only for test ‘Todo’ list to details ,not the osc 's code ，自己测试的
 *
 * */
class TodoDetailsPage extends StatelessWidget {

  final Todo todo;

  TodoDetailsPage({Key key,@required this.todo}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Text('${todo.description}'),),
    );
  }
}
