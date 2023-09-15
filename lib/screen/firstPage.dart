import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:coffee/临时数据/测试.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key,});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ScrollController _scrollController = ScrollController();

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Widget con = cont(context);

    return  CustomScrollView(

          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return con;
                },
                childCount: 1,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _Header(xxx: '最新上架'),
            ),
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
            ),
            SliverPersistentHeader(
              pinned: true ,
              delegate: _Header(xxx: '起飞'),
            ),
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
            ),
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
  _Header({required this.xxx});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _getHeadRow(xxx);
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
    color: const Color.fromRGBO(255, 255, 255, 1.0),
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