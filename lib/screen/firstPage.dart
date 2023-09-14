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
              delegate: _CustomHeaderDelegate(
                minHeight: 40.0,
                maxHeight: 50.0,
                child: Container(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        // height: 40,
                        width: maxWidth,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => {

                              },
                              child: Text(
                                '最新上架',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(Icons.arrow_right),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 8),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    // color: Colors.orange,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color.fromRGBO(196, 196, 196, 1),
                                        width: 1),
                                  ),
                                  child: Text(
                                    '查看更多',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), //吸顶
                  ),
                ),
              ),
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
              pinned: true,
              delegate: _CustomHeaderDelegate(
                minHeight: 40.0,
                maxHeight: 50.0,
                child: Container(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        height: 40,
                        width: maxWidth,
                        child: Row(
                          children: [
                            Text(
                              '起飞',
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(Icons.arrow_right),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 8),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    // color: Colors.orange,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color.fromRGBO(196, 196, 196, 1),
                                        width: 1),
                                  ),
                                  child: Text(
                                    '查看更多',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), //吸顶
                  ),
                ),
              ),
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
