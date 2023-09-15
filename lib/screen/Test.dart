import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  final ScrollController _controller1 = ScrollController();
  double beforeOffset = 0;
  double beforeAfterOffset = 0;
  double afterOffset = 0;
  bool _headersTouched = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleScroll);
    _controller.addListener(_handleScroll1);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    _controller1.removeListener(_handleScroll1);
    _controller1.dispose();
    super.dispose();
  }

  void _handleScroll1() {
    // print('当前屏幕滑动距离:${_controller1.offset}');
    if(afterOffset != null ){
      // _controller1.jumpTo(afterOffset) ;
    }
    // _controller1.offset = afterOffset;
  }

  void _handleScroll() {
    // print('屏幕高度:${_controller.position.viewportDimension}');
    // print('最大可滚动距离:${_controller.position.maxScrollExtent}');
    // print('当前屏幕滑动距离:${_controller.offset}');
    //
    // print(_headersTouched);
    // print(_controller.position.maxScrollExtent - _controller.position.viewportDimension);

    if(_controller.offset > (_controller.position.viewportDimension * 2 + 0)
    || _controller.offset < (_controller.position.viewportDimension * 2+ 0)){
      setState(() {
            _headersTouched = true;
          });
    }

    if(_controller.offset > _controller.position.viewportDimension * 2+ 0
    &&
        _controller.offset < _controller.position.viewportDimension * 3+ 0
    ){
      // print(_controller.offset);
      setState(() {
        _headersTouched = false  ;
        if(beforeOffset == 0){
          beforeOffset = _controller.offset;  //记录吸顶元素相互接触时的滚动位置
        }
        beforeAfterOffset = afterOffset;
        afterOffset = _controller.offset - beforeOffset; // 接触后的位置减去初始位置，得到接触后的滚动距离

        if(afterOffset <= _controller.position.viewportDimension * 0.1) {
          if (beforeAfterOffset - afterOffset < -10) { //滑动很快的时候，直接去芜湖选项
            // print('${afterOffset},${beforeAfterOffset}');
            print('大了大了,${beforeAfterOffset - afterOffset}');
            _controller1.jumpTo(_controller.position.viewportDimension * 0.1);
          } else { //滑动不快的话，就按像素叠加直到去到芜湖选项
            // print('${afterOffset},${beforeAfterOffset}');
            _controller1.jumpTo(afterOffset);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    List<String> currentTitle = ['起飞', '芜湖', 'wdnmd', 'rrrzz'];
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: maxHeight * 0.1,
                child: ListTile(
                  title: Text('Item $index'),
                ),
              ),
              childCount: 10,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: maxHeight * 0.1,
              maxHeight: maxHeight * 0.1,
             child: Container(

               color:
               // Colors.red,
               _headersTouched
                   ? Color.fromRGBO(158, 158, 77, 0.5)
                   : Color.fromRGBO(77, 77, 77, 0.5),
               child:  ListView(
                 controller: _controller1,
                 // shrinkWrap: true,
                 // physics: NeverScrollableScrollPhysics(),
                 children: [
                   for (int i = 0; i < currentTitle.length; i++)
                     Container(
                       alignment: Alignment.topCenter,
                       // color: Colors.green,
                       height: maxHeight * 0.1,
                       // alignment: Alignment.center,
                       child: Text(
                         currentTitle[i],
                       ),

                     ),
                 ],
               ),
             ),



            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: maxHeight * 0.1,
                child: ListTile(
                  title: Text('Item $index'),
                ),
              ),
              childCount: 10,
            ),
          ),

          SliverPersistentHeader(
            pinned: false,
            delegate: _SliverAppBarDelegate(
              minHeight: maxHeight * 0.1,
              maxHeight: maxHeight * 0.1,
              child: Container(
                // alignment: Alignment.topCenter,
                color:
                Colors.purple,
                // _headersTouched
                //     ? Color.fromRGBO(158, 158, 77, 0.5)
                //     : Color.fromRGBO(77, 77, 77, 0.5),
                child: Center(
                  child: Text(
                    '芜湖',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
