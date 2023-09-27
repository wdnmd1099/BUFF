import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:coffee/临时数据/测试.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key,});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> title = ['最新上架','特殊磨损','金贴专区'];
  String currentTitle = '最新上架';
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {_handleScroll1();});



  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll1() {
    double current = _scrollController.offset - 173;  //减去头部的滚动距离
      // print(current);
    // for(int i = 0; i<title.length;i++){}
      double cut =  current / (841);
      if(cut >= 0 && cut < 1){
        setState(() {
          currentTitle = title[0];
        });
      }
      else if(cut >= 1 && cut < 2){
        setState(() {
          currentTitle = title[1];
        });
      }
      else if(cut >= 2 && cut < 3){
        setState(() {
          currentTitle = title[2];
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    return  CustomScrollView(
      controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const FirstPageHeader();
                },
                childCount: 1,
              ),
            ), //头部
            SliverPersistentHeader(
              pinned: true,
              delegate: _Header(xxx: '${currentTitle}',ccc: 1),
            ), //最新上架
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    // height: maxHeight < maxHeight * 1.4 ? maxHeight * 2 : maxHeight,
                    child: GridView.builder(
                      itemCount: gridList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 150,
                        // childAspectRatio:1.2,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // print(maxHeight);
                        var item = gridList[index];
                        return Container(
                          color: Colors.orange,
                          child: Text('${item['ID']}'),
                        );
                      },
                    ),
                  );
                },
                childCount: 1,
              ),
            ), // 最新上架的展示内容
            SliverPersistentHeader(
              pinned: false ,
              delegate: _Header(xxx: '特殊磨损',ccc: 2),
            ), //特殊磨损
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    // height: maxHeight < maxHeight * 1.4 ? maxHeight * 2 : maxHeight,
                    child: GridView.builder(
                      itemCount: gridList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 150,
                        // childAspectRatio:1.2,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // print(maxHeight);
                        var item = gridList[index];
                        return Container(
                          color: Colors.orange,
                          child: Text('${item['ID']}'),
                        );
                      },
                    ),
                  );
                },
                childCount: 1,
              ),
            ),//特殊磨损的展示内容
            SliverPersistentHeader(
              pinned: false ,
              delegate: _Header(xxx: '金贴专区',ccc: 2),
            ), //特殊磨损
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    // height: maxHeight < maxHeight * 1.4 ? maxHeight * 2 : maxHeight,
                    child: GridView.builder(
                      itemCount: gridList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 150,
                        // childAspectRatio:1.2,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // print(maxHeight);
                        var item = gridList[index];
                        return Container(
                          color: Colors.orange,
                          child: Text('${item['ID']}'),
                        );
                      },
                    ),
                  );
                },
                childCount: 1,
              ),
            ),//金贴专区的展示内容
          ],
        );


  }
}

class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_CustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}


class _Header extends SliverPersistentHeaderDelegate {
  String xxx ;
  int ccc;
  _Header({required this.xxx,required this.ccc});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if(ccc == 1){
      return _getHeadRow(xxx);
    }else if(ccc == 2){
      return _getHeadRow1(xxx);
    }else{ return _getHeadRow1(xxx);}

  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget _getHeadRow(String x) {
  return Container(
    height: 50,
    color: Colors.red,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          x,
          style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18),
        ),
      ],
    ),
  );
}

Widget _getHeadRow1(String x) {
  return Container(
    height: 50,
    color: Colors.green,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          x,
          style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18),
        ),
      ],
    ),
  );
}