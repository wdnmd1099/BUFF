import 'package:bot_toast/bot_toast.dart';
import 'package:coffee/screen/buffPages/printFlowerSeachPage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../stateManage/stateManage.dart';

class Printed extends StatefulWidget {
  Printed({
    super.key,
  });

  @override
  State<Printed> createState() => _State();
}

class _State extends State<Printed> with SingleTickerProviderStateMixin{
  late Animation<double> scaleAnimation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // upperBound:1.4,
      // lowerBound: 0.5,
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    scaleAnimation = Tween<double>(begin: 1,end: 0.8).animate(_animationController);

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        print('wancheng');
        _animationController.reverse();
        print(chooseFlowerPosition);


      }
    });
  }
  bool chooseFlowerPosition = false;
  List popularKnifes = [
    '深红之网',
    '表面淬火',
    '渐变大理石',
    '多普勒',
    '渐变之色',
    '无涂装',
    '自动化',
    '屠夫',
    '虎牙',
    '伽玛多普勒',
    '传说',
    '大马士革钢',
    '外表生锈',
    '致命紫罗兰',
  ];
  List weapon = [
    '二西莫夫',
    '黑色魅影',
    '印花集',
    '表面淬火',
    '塔罗牌',
    '血腥运动',
    '机械革命',
    '渐变之色',
    '深红之网',
    '精英之作',
  ];

  int currentIndex = 2; //选择不限还是自定义印花按钮的index
  int selectedNum = 0; //当前选择了多少个印花，最大4个

  //总共已选择的印花
  // List<dynamic> selected = [];

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final titleList = Provider.of<TitleList>(context);
    final printFlower = Provider.of<PrintFlower>(context);
    List selectList = printFlower.getSelectedFlower;
    String selectedIcon = '<svg t="1696478038795" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="19733" width="32" height="32"><path d="M796.912941 297.562353L407.491765 692.705882l-156.611765-172.272941a30.177882 30.177882 0 0 0-44.574118 40.658824L361.411765 734.569412a60.235294 60.235294 0 0 0 85.232941 3.915294l2.409412-2.409412 390.927058-396.348235a30.117647 30.117647 0 1 0-43.068235-42.164706z" fill="#1296db" p-id="19734"></path><path d="M813.176471 0H210.823529a210.823529 210.823529 0 0 0-210.823529 210.823529v602.352942a210.823529 210.823529 0 0 0 210.823529 210.823529h602.352942a210.823529 210.823529 0 0 0 210.823529-210.823529V210.823529a210.823529 210.823529 0 0 0-210.823529-210.823529z m150.588235 813.176471a150.588235 150.588235 0 0 1-150.588235 150.588235H210.823529a150.588235 150.588235 0 0 1-150.588235-150.588235V210.823529a150.588235 150.588235 0 0 1 150.588235-150.588235h602.352942a150.588235 150.588235 0 0 1 150.588235 150.588235z" fill="#1296db" p-id="19735"></path></svg>';
    String unselectIcon =
        '<svg t="1696382819736" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4081" width="32" height="32"><path d="M818.655 971.545h-613.312c-84.303 0-152.886-66.343-152.886-147.89v-623.306c0-81.549 68.585-147.89 152.886-147.89h613.312c84.303 0 152.886 66.342 152.886 147.89v623.306c0 81.548-68.585 147.89-152.886 147.89zM205.345 123.155c-45.318 0-82.19 34.628-82.19 77.191v623.306c0 42.564 36.869 77.191 82.19 77.191h613.312c45.318 0 82.19-34.627 82.19-77.191v-623.306c0-42.563-36.869-77.191-82.19-77.191h-613.312z" fill="#bfbfbf" p-id="4082"></path></svg>';
    String copyAddIcon =
        '<svg t="1696470590688" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="14425" width="200" height="200"><path d="M633.363692 310.567385h-381.243077a88.418462 88.418462 0 0 0-88.418461 88.418461v376.713846a88.418462 88.418462 0 0 0 88.418461 88.418462h381.243077a88.418462 88.418462 0 0 0 88.418462-88.418462v-376.713846a88.418462 88.418462 0 0 0-88.418462-88.418461z m-94.12923 314.683077h-57.107693v57.107692a39.384615 39.384615 0 0 1-39.384615 39.384615 39.246769 39.246769 0 0 1-39.384616-39.384615v-57.107692h-57.107692a39.246769 39.246769 0 0 1-39.384615-39.384616 39.384615 39.384615 0 0 1 39.384615-39.384615h57.107692v-57.107693a39.246769 39.246769 0 0 1 39.384616-39.384615 39.384615 39.384615 0 0 1 39.384615 39.384615v57.107693h57.107693a39.384615 39.384615 0 0 1 39.384615 39.384615 39.246769 39.246769 0 0 1-39.384615 39.384616z" fill="#bfbfbf" p-id="14426"></path><path d="M780.8 159.763692H417.792a39.384615 39.384615 0 0 0-39.384615 39.384616 39.384615 39.384615 0 0 0 39.384615 39.384615H780.8a12.622769 12.622769 0 0 1 12.603077 12.603077v366.749538a39.384615 39.384615 0 0 0 39.384615 39.384616 39.384615 39.384615 0 0 0 39.384616-39.384616V251.136a91.470769 91.470769 0 0 0-91.372308-91.372308z" fill="#bfbfbf" p-id="14427"></path></svg>';

    String closeIcon = '<svg t="1696472138532" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="16459" width="32" height="32"><path d="M85.333333 512C85.333333 276.352 276.309333 85.333333 512 85.333333c235.648 0 426.666667 190.976 426.666667 426.666667 0 235.648-190.976 426.666667-426.666667 426.666667-235.648 0-426.666667-190.976-426.666667-426.666667z m426.666667-30.165333l-105.685333-105.706667a21.269333 21.269333 0 0 0-30.08 0.106667 21.205333 21.205333 0 0 0-0.106667 30.08L481.834667 512l-105.706667 105.685333a21.269333 21.269333 0 0 0 0.106667 30.08 21.205333 21.205333 0 0 0 30.08 0.106667L512 542.165333l105.685333 105.706667a21.269333 21.269333 0 0 0 30.08-0.106667 21.205333 21.205333 0 0 0 0.106667-30.08L542.165333 512l105.706667-105.685333a21.269333 21.269333 0 0 0-0.106667-30.08 21.205333 21.205333 0 0 0-30.08-0.106667L512 481.834667z" fill="#bfbfbf" p-id="16460"></path></svg>';


    return Container(
      height: maxHeight,
      width: maxWidth,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: maxHeight * 0.1,
            width: maxWidth,
            color: Colors.white,
            padding: EdgeInsets.only(left: 12, top: maxHeight * 0.05),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      '已贴印花',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  currentIndex == 2
                      ? Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(right: 12, top: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.string(
                                  unselectIcon,
                                  // colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate),
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 2, left: 8),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '印花无刮',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ), //类型固定头部

          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 30),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 1;
                                  titleList.getColumNavigation[2] = '已贴印花';
                                  titleList.getIsChangeOrNot[2] = false;
                                  titleList.reFresh();
                                });
                              },
                              child: Container(
                                // color: Colors.red,
                                // alignment: Alignment.topCenter,
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: (maxWidth * 0.8 - 24) / 2,
                                      decoration: BoxDecoration(
                                        color: currentIndex == 1
                                            ? const Color.fromRGBO(
                                                238, 162, 14, 1)
                                            : Colors.white,
                                        border: Border.all(
                                          color: currentIndex == 1
                                              ? Colors.white
                                              : Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '不限',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: currentIndex == 1
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 2;
                                  titleList.getColumNavigation[2] = '自定义印花';
                                  titleList.getIsChangeOrNot[2] = true;
                                  titleList.reFresh();
                                });
                              },
                              child: Container(
                                // color: Colors.red,
                                // alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: (maxWidth * 0.8 - 40) / 2,
                                      decoration: BoxDecoration(
                                        color: currentIndex == 2
                                            ? const Color.fromRGBO(
                                                238, 162, 14, 1)
                                            : Colors.white,
                                        border: Border.all(
                                          color: currentIndex == 2
                                              ? Colors.white
                                              : Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '自定义印花',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: currentIndex == 2
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
                //不限和自定义按钮
                const SliverPadding(
                  padding: EdgeInsets.only(top: 30),
                ),

                currentIndex == 2
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 12),
                                    alignment: Alignment.bottomCenter,
                                    // color: Colors.red,
                                    height: 24,
                                    child: const Text(
                                      '自定义印花',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    // color: Colors.yellow,
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '$selectedNum / 4',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ),
                                  currentIndex == 2
                                      ? Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            // padding: const EdgeInsets.only(right: 12, top: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap:(){

                                                    setState(() {
                                                      chooseFlowerPosition = !chooseFlowerPosition;
                                                      _animationController.forward();
                                                    });
                                                    // if(_animationController.isDismissed){
                                                    //   _animationController.forward();
                                                    // }else if(_animationController.isCompleted){
                                                    //   _animationController.reverse();
                                                    // }
                                                    print('xie');
                                                  },
                                                  child: ScaleTransition(
                                                    scale: scaleAnimation,
                                                    child: chooseFlowerPosition?SvgPicture.string(
                                                      selectedIcon,
                                                      width: 20.0,
                                                      height: 20.0,
                                                    ):SvgPicture.string(
                                                      unselectIcon,
                                                      width: 20.0,
                                                      height: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0,
                                                          bottom: 2,
                                                          left: 8),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    '印花位置',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            );
                          },
                          childCount: 1,
                        ),
                      )
                    : const SliverPadding(padding: EdgeInsets.all(0)),
                //自定义印花bar
                const SliverPadding(
                  padding: EdgeInsets.only(top: 15),
                ),

                currentIndex == 2 && selectList.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: selectList.length, //数组长度
                              itemBuilder: (BuildContext context, int index) {
                                var item =
                                    selectList[index]; //index是当前元素的下标，这样就指当前元素
                                return Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 0,
                                          top: 12,
                                          right: 12,
                                          left: 12),
                                      height: 72,
                                      width: maxWidth,
                                      decoration: const BoxDecoration(
                                        // color: Color.fromRGBO(246, 248, 252, 1),
                                        // color: Colors.red,
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 8),
                                        color: Color.fromRGBO(246, 248, 252, 1),
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              color: item['color'],
                                              height: 40,
                                              width: 60,
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 12),
                                                child: Text(
                                                  '${item['title']}',
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  printFlower.pushFlower(item);
                                                });
                                              },
                                              child: Container(
                                                width: 30,
                                                // color: Colors.red,
                                                child: Center(
                                                  child: SvgPicture.string(
                                                    copyAddIcon,
                                                    width: 20.0,
                                                    height: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),  //当前选择印花信息
                                    Positioned(
                                      right: 0,
                                      bottom: 45,
                                      child:  GestureDetector(
                                        onTap:(){
                                          setState(() {
                                            printFlower.delFlower(index);
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          // color: Colors.red,
                                          child: SvgPicture.string(
                                            closeIcon,
                                            width: 24.0,
                                            height: 24.0,
                                          ),
                                        ),
                                      ),
                                    ), //删除印花按钮
                                  ],
                                );
                              },
                            );
                          },
                          childCount: 1,
                        ),
                      )
                    : SliverPadding(padding: EdgeInsets.all(0)),  //已选印花

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return currentIndex == 2 &&
                              printFlower.getSelectedFlower.length < 4
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 150),
                                    pageBuilder: (_, __, ___) =>
                                        const PrintFlowerSeachPage(),
                                    transitionsBuilder:
                                        (_, animation, __, child) {
                                      return SlideTransition(
                                        position: Tween(
                                          begin: Offset(1.0, 0.0),
                                          // (1.0,0.0)是从右到左出现
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12,top: 12),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  color: const Color.fromRGBO(149, 149, 149, 1),
                                  dashPattern: const [4, 4, 4, 4],
                                  borderType: BorderType.RRect,
                                  // radius: Radius.circular(12),
                                  padding: const EdgeInsets.all(6),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: maxWidth * 0.8 - 24,
                                    color: Colors.transparent,
                                    child: const Text(
                                      '+选择印花',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(78, 120, 202, 1)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                    childCount: 1,
                  ),
                ), //虚线添加框
              ],
            ),
          ), //可滚动选择选项区域
        ],
      ),
    ); //类型页面
  }
}
