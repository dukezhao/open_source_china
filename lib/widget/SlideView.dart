import 'package:flutter/material.dart';

/*
as viewpager ,slide to move & show group of Widget
*/

class SlideView extends StatefulWidget {

  var data; //content in the slide-Showing

  SlideView(data) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() //=> _SlideViewState();
  {
    //can transfer the parameter in controcutor method for SlideViewState using ;
    //otherwise use non-parameter transfer , but use this.widget.data take value of the var :data which inSlideView in SlideViewState
    return SlideViewState(data);
  }
}

class SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin is what todo

  //TabController is the controller for TabBarView Widget， it's SlideView's controller
  TabController tabController;
  List slideData;

  SlideViewState(data) {
    slideData = data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //init controller
    tabController = TabController(
        length: slideData == null ? 0 : slideData.length, vsync: this);
  }


  @override
  void dispose() {
    // 销毁
    tabController.dispose();
    super.dispose();
  }

 /* TabBarView组件主要的参数是controller和children，controller代表这个TabBarView的控制器，
  children表示这个组件中的各个页面。SliderView中的data是在new这个对象时通过构造方法传入的，data是一个map数组，map中包含imgUrl title detailUrl3个字段。
*/


  @override
  Widget build(BuildContext context) {
    //todo return a list content are :
    List<Widget> items = [];
    if (slideData != null && slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        //pic urlU
        var imgUrl = item['imgUrl'];
        //news title
        var title = item['title'];
        //news details URL
        var detailUrl = item['detailUrl'];
        items.add(GestureDetector(
          onTap: () {
            //click ->details page

          },
          child: Stack( //Stack组件用于将资讯标题文本放置到图片上面
            children: <Widget>[
              Image.network(imgUrl),
new Container(
  //title‘是container is same with screen width ’
  width: MediaQuery.of(context).size.width,
  //bgcolor is black add transparent effort ;
  color: const Color(0x50000000),
  //title text add inner padding
  child: Padding(
    padding: const EdgeInsets.all(6.0),
    //font size
    child: Text(title,style: TextStyle(color: Colors.white,fontSize: 15.0),),
  ),
)
            ],
          ),
        ));
      }
    }


    return new TabBarView(
      controller: tabController,
      children: items,
    );
  }
}
