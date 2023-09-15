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
  ScrollController _controller = ScrollController();
  bool _headersTouched = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // print('屏幕高度:${_controller.position.viewportDimension}');
    // print('最大可滚动距离:${_controller.position.maxScrollExtent}');
    // print('当前屏幕滑动距离:${_controller.offset}');

    // print(_headersTouched);
    // print(_controller.position.maxScrollExtent - _controller.position.viewportDimension);

    if(_controller.offset > (_controller.position.viewportDimension * 2 + 0)
    || _controller.offset < (_controller.position.viewportDimension * 2+ 0)){
      setState(() {
            _headersTouched = true;
          });
    }

    if(_controller.offset > _controller.position.viewportDimension * 2+ 0){
      setState(() {
        _headersTouched = false  ;
      });
    }


    // if (_controller.offset >=
    //     (_controller.position.maxScrollExtent - _controller.position.viewportDimension)) {
    //   setState(() {
    //     _headersTouched = true;
    //   });
    // } else {
    //   setState(() {
    //     _headersTouched = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index)=>
                    Container(
                      height: maxHeight*0.1,
                      child: ListTile(
                        title: Text('Item $index'),
                      ),
                    ),

              childCount: 10,
            ),
          ),
          SliverPersistentHeader(
            pinned: _headersTouched,
            delegate: _SliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 60,
              child: Container(
                color: _headersTouched ? Color.fromRGBO(158,158,77,0.5) : Color.fromRGBO(77, 77, 77, 0.5),
                child: Center(
                  child: Text(
                    _headersTouched?'起飞':'尚未起飞',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    height: maxHeight*0.1,
                    child: ListTile(
                      title: Text('Item $index'),
                    ),
                  ),
              childCount: 10,
            ),
          ),

          // _headersTouched?SliverPadding(padding: EdgeInsets.all(0)):SliverPersistentHeader(
          //   pinned: false,
          //   delegate: _SliverAppBarDelegate(
          //     minHeight: 60,
          //     maxHeight: 60,
          //     child: Container(
          //       color: _headersTouched ? Color.fromRGBO(77, 77, 77, 0.5) : Color.fromRGBO(77, 77, 77, 0.5),
          //       child: Center(
          //         child: Text(
          //           _headersTouched?'尚未起飞':'起飞',
          //           style: TextStyle(color: Colors.white, fontSize: 24),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 60,
              child: Container(
                color: _headersTouched ? Color.fromRGBO(158,158,77,0.5) : Color.fromRGBO(77, 77, 77, 0.5),
                child: Center(
                  child: Text(
                    'Header 1',
                    style: TextStyle(color: Colors.white, fontSize: 24),
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
              childCount: 30,
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
