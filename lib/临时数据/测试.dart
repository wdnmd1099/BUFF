import 'package:coffee/screen/seachPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../公共方法/jumpingCircularAnimation.dart';

List gridList = [
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },

  // {'磨损':'','ID':'','价钱':'','在售数量':'','图片地址':'',},
];
List columNavigation = ['类型','热门内容','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
List knife = [
  '不限','蝴蝶刀','M9刺刀','爪子刀','骷髅匕首','刺刀','锯齿爪刀','流浪者匕首','折叠刀','短剑','海报短刀','熊刀','猎杀者匕首','系绳匕首','求生匕首','弯刀','暗影双匕','鲍伊猎刀','穿肠刀','折刀',
];
List<String> glove= ['不限','运动手套','专业手套','摩托手套','驾驶手套','手部束带','狂牙手套','九头蛇手套','血猎手套',];
List<String> rifle= ['不限','AK-47','AWP','M4A1消音版','M4A4','AUG','SG553','法玛斯','加利尔AR','SSG 08','SCAR-20','G3SG1',];
List<String> pistol= ['不限','沙漠之鹰','USP消音版','格洛克18型','P2000','P250','FN57','R8左轮手枪','Tec-9','双持贝瑞塔','CZ75自动手枪',];
List<String> submachineGun= ['不限','MP9','MAC-10','UMP-45','P90','MP7','PP-野牛','MP5-SD',];
List<String> shotgun= ['不限','MX1014','MAG-7','截断霰弹枪','新星',];


class FirstPageHeader extends StatefulWidget {
  const FirstPageHeader({super.key});

  @override
  State<FirstPageHeader> createState() =>
      _FirstPageHeaderState();
}
class _FirstPageHeaderState extends State<FirstPageHeader> {
  double currentX = 0;
  double currentY = 0;



  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 173,
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
                              padding:
                              EdgeInsets.only(left: 4, right: 2, top: 2),
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
                                    color: Color.fromRGBO(162, 162, 162, 1)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 8),
                                alignment: Alignment.centerRight,
                                // color: Colors.green,
                                child: Icon(Icons.border_outer,
                                    size: 32,
                                    color: Color.fromRGBO(162, 162, 162, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (TapUpDetails tapUpDetails){
                    // testFn(tapUpDetails.globalPosition.dx);
                    setState(() {
                      currentX = tapUpDetails.globalPosition.dx;
                      currentY = tapUpDetails.globalPosition.dy;
                    });
                    Navigator.of(context).push(
                      CirclePageRoute(builder: (context) {
                        return const SeachPage();
                      },  cX:currentX,cY: currentY,transitionDuration:const Duration(milliseconds: 350), ),);
                  },
                  child: Container(
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
                  padding:
                  EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
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
                                    Color.fromRGBO(151, 64, 64, 1),
                                    Color.fromRGBO(200, 126, 125, 1)
                                  ],
                                ),
                              ),
                              height: 30,
                              child: Text(
                                '印花搜枪',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                  padding:
                  EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8),
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
                                    Color.fromRGBO(83, 146, 103, 1),
                                    Color.fromRGBO(125, 186, 146, 1)
                                  ],
                                ),
                              ),
                              height: 30,
                              child: Text(
                                '类型筛选',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                  padding:
                  EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8),
                  // color: Colors.yellow,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(color: Colors.green),
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(56, 88, 148, 1),
                                    Color.fromRGBO(152, 176, 212, 1)
                                  ],
                                ),
                              ),
                              height: 30,
                              child: Text(
                                '汰换合同',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                  padding:
                  EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 8),
                  // color: Colors.purple,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(color: Colors.orange),
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(245, 209, 130, 1),
                                    Color.fromRGBO(234, 222, 163, 1)
                                  ],
                                ),
                              ),
                              height: 30,
                              child: Text(
                                '巴黎Major',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
          ), //四等分海报导航
        ],
      ),
    );
  }
}
