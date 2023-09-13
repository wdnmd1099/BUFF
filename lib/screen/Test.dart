import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestedScrollView Example',
      theme: ThemeData(
          // primarySwatch: Colors.orange,
          //   primaryColor:Colors.transparent,
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    List gridList = [
      {
        '磨损': '久经沙场',
        'ID': 'AK47|抽象派1337',
        '价钱': '144',
        '在售数量': '1000+',
        '图片地址': '',
      },
      {
        '磨损': '崭新出厂',
        'ID': '格洛克18型|本生灯',
        '价钱': '0.93',
        '在售数量': '132',
        '图片地址': '',
      },
      {
        '磨损': '略有磨损',
        'ID': 'CZ75|先驱',
        '价钱': '133.23',
        '在售数量': '251',
        '图片地址': '',
      },
      {
        '磨损': '久经沙场',
        'ID': 'SSG 08|浮生若梦',
        '价钱': '699',
        '在售数量': '356',
        '图片地址': '',
      },
      {
        '磨损': '破损不堪',
        'ID': 'AK47|夜愿',
        '价钱': '4444',
        '在售数量': '444',
        '图片地址': '',
      },
      {
        '磨损': '略有磨损',
        'ID': 'AK47|黄金藤蔓',
        '价钱': '38764',
        '在售数量': '321',
        '图片地址': '',
      },
      {
        '磨损': '略有磨损',
        'ID': 'M4A4|波塞冬',
        '价钱': '10247',
        '在售数量': '123',
        '图片地址': '',
      },
      {
        '磨损': '久经沙场',
        'ID': 'AWP|九头金蛇',
        '价钱': '23412',
        '在售数量': '244',
        '图片地址': '',
      },
      {
        '磨损': '崭新出厂',
        'ID': 'USP|印花集',
        '价钱': '1321',
        '在售数量': '375',
        '图片地址': '',
      },

      // {'磨损':'','ID':'','价钱':'','在售数量':'','图片地址':'',},
    ];
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPadding(padding: EdgeInsets.only(left: 0))
            ];
          },
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height:200,
                      width: maxWidth,
                      child: ListView(
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 50,
                            padding: EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      // padding: EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      height: 40,
                                      color: Color.fromRGBO(240, 240, 240, 1),
                                      child: Container(
                                        // color: Colors.black,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 4, right: 2, top: 2),
                                              // color: Colors.purple,
                                              child: Center(
                                                child: Icon(
                                                  Icons.search,
                                                  size: 19,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              // color: Colors.yellow,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                '搜索',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromRGBO(
                                                        162, 162, 162, 1)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                EdgeInsets.only(right: 8),
                                                alignment: Alignment.centerRight,
                                                // color: Colors.green,
                                                child: Icon(Icons.border_outer,
                                                    size: 32,
                                                    color: Color.fromRGBO(
                                                        162, 162, 162, 1)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.green,
                                  padding: EdgeInsets.only(
                                    right: 12,
                                    left: 15,
                                  ),
                                  child: Icon(
                                    Icons.accessibility,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ), //搜索框一栏
                          Container(
                            // color: Colors.red,
                            height: 123,
                            width: maxWidth,
                            child: Row(
                              children: [
                                Container(
                                  width: maxWidth / 4,
                                  height: 143,
                                  padding: EdgeInsets.only(
                                      left: 8, top: 8, right: 4, bottom: 8),
                                  // color: Colors.black,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: Colors.yellow,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        151, 64, 64, 1),
                                                    Color.fromRGBO(
                                                        200, 126, 125, 1)
                                                  ],
                                                ),
                                              ),
                                              height: 30,
                                              child: Text(
                                                '印花搜枪',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: maxWidth / 4,
                                  padding: EdgeInsets.only(
                                      left: 4, top: 8, right: 4, bottom: 8),
                                  // color: Colors.grey,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        83, 146, 103, 1),
                                                    Color.fromRGBO(
                                                        125, 186, 146, 1)
                                                  ],
                                                ),
                                              ),
                                              height: 30,
                                              child: Text(
                                                '类型筛选',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: maxWidth / 4,
                                  padding: EdgeInsets.only(
                                      left: 4, top: 8, right: 4, bottom: 8),
                                  // color: Colors.yellow,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child:
                                              Container(color: Colors.green),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        56, 88, 148, 1),
                                                    Color.fromRGBO(
                                                        152, 176, 212, 1)
                                                  ],
                                                ),
                                              ),
                                              height: 30,
                                              child: Text(
                                                '汰换合同',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: maxWidth / 4,
                                  padding: EdgeInsets.only(
                                      left: 4, top: 8, right: 8, bottom: 8),
                                  // color: Colors.purple,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child:
                                              Container(color: Colors.orange),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        245, 209, 130, 1),
                                                    Color.fromRGBO(
                                                        234, 222, 163, 1)
                                                  ],
                                                ),
                                              ),
                                              height: 30,
                                              child: Text(
                                                '巴黎Major',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _CustomHeaderDelegate(
                  minHeight: 50.0,
                  maxHeight: 50.0,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child:
                          Text('Item 2', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: maxHeight * 1,
                      width: maxWidth,
                      child: GridView.builder(
                          itemCount: gridList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var item = gridList[index];
                            return Container(
                              // height: 30,
                              color: Colors.red,
                              child: Text('${item['ID']}'),
                            );
                          }),
                    );
                  },
                  childCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
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
