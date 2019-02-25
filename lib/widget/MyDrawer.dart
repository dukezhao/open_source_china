import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  //由于不需要更新，所以是无状态的组件，
  //the size of icon which before the menu's text
  static const double IMAGE_ICON_WIDTH = 30.0;

  //  the size of icon after the menu's text
  static const double ARROW_ICON_WIDTH = 16.0;

  //  the arrow icon before the menu
  var rightArrowIcon = Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );

  //the text of menu
  List menuTitles = [
    'distribute News',
    'dynmic SmallHouse',
    'about',
    'settings'
  ];

  //the icon before the menu'text
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];

  //the style of menuText
  TextStyle menuStyle = TextStyle(
    fontSize: 15.0,
  );

  //todo some code need to ba add,这里省略了部分代码，回头看有必要再补充

  //build方法中的ConstraintedBox组件和Material组件都是直接参考的Drawer类的源码
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      //the Widget make ::用于给组件加上强约束，
      constraints: const BoxConstraints.expand(width: 304.0), //指定drawer的宽度，
      child: Material(
        //todo 注意这里是Material widget

        elevation: 16.0, //控制Drawer后边阴影的大小，默认就16，所以这里可以省略
        child: new Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
          ),
          child: new ListView.builder(
            itemCount: menuTitles.length * 2 + 1,
            //listView的build方法，其中的*2是将分割线算入到item中了，+1则是把顶部的封面图算入到item中了

            itemBuilder: renderRow,
          ),
        ),
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) //顶部cover图
    {
      //render cover image
      var img = Image.asset(
        'images/cover_img.jpg',
        width: 304.0,
        height: 304.0,
      );

      return Container(
        width: 304.0,
        height: 304.0,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: img,
      );
    }

    index -= 1;  //舍去之前的封面图,即开始算index是divider还是item,不能算封面图。
    //如果是技术则渲染分割线
    if (index.isOdd) {
      return Divider();
    }
    //偶数，、2取整，渲染item
    index = index ~/ 2;
    var listItemContent = Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      //Row 组件构成item的一行

      child: Row(
        children: <Widget>[
          //菜单item的图标
          getIconImage(menuIcons[index]),//todo find the method from source

          //菜单的item的文本
          Expanded(//该组件类似于在Android中布局时添加android:layout_weight="1"属性，
            // 上面使用Expanded包裹的Text组件在水平方向上会占据除icon和箭头图标外的剩余的所有空间；
              child: Text(
            menuTitles[index],
            style: menuStyle,
          )),
          rightArrowIcon
        ],
      ),
    );
    return InkWell(//最后返回了一个InkWell组件，用于给菜单item添加点击事件，但是在Drawer中点击菜单
      // 时并没有水波纹扩散的效果（不知道是什么原因）。
      child: listItemContent,
      onTap: () {
        print("click list item $index");
      },
    );
  }

 Widget getIconImage(path) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: Image.asset(path,width: 28.0,height: 28.0,),
    );
 }
}
