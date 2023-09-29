import 'package:bot_toast/bot_toast.dart';
import 'package:coffee/screen/buffPages/typePage.dart';
import 'package:flutter/material.dart';
import '../../临时数据/测试.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _State();
}

class _State extends State<SeachPage> {
  int currentIndex = 0;      //indexStack的index





  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;


    return Material(
      child: Container(
        height: maxHeight,
        width: maxWidth,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: maxHeight * 0.91,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: IndexedStack(
                        index: currentIndex,
                        children: [
                         TypePage(), //类型页面


                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.red,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.orange,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.red,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.orange,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.orange,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.red,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.orange,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.red,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight ,
                    width: maxWidth * 0.2,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        for(int i=0;i<columNavigation.length;i++)
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                currentIndex = i;
                              });
                            },
                            child:Container(
                              // padding: EdgeInsets.only( top: 5),

                              child:  Container(
                                height: (maxHeight * 0.9) / 9.2,
                                width: maxWidth * 0.2,
                                // color: Colors.orange,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    left: BorderSide(
                                      color: currentIndex == i? Colors.white:Colors.grey,
                                      width: 0.5,
                                    ),
                                    top: BorderSide(
                                      color: currentIndex == i? Colors.grey:Colors.white,
                                      width: 0,
                                    ),
                                    bottom: BorderSide(
                                      color: currentIndex == i? Colors.grey:Colors.white,
                                      width: 0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child:Text(
                                    '${columNavigation[i]}',
                                    style: TextStyle(fontSize: 14,
                                      color: currentIndex == i? Colors.black : const Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ), //右侧纵向导航
                ],
              ),
            ),
            Container(
              height: maxHeight * 0.09,
              width: maxWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0), // x, y偏移值控制阴影的位置
                    blurRadius: 4.0, // 模糊半径控制阴影的程度
                  ),
                ],
              ),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: maxWidth / 2,
                      height: maxHeight * 0.09 ,
                      padding: const EdgeInsets.only(top: 12,left: 12,right: 6,bottom: 12),
                      child: GestureDetector(
                          onTap: (){print('重置');},
                          child: Container(
                            color: const Color.fromRGBO(69, 83, 108, 1),
                            child: const Center(
                              child:Text('重置',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                    ),
                    Container(
                      width: maxWidth / 2,
                      height: maxHeight * 0.09,
                      padding: const EdgeInsets.only(top: 12,left: 6,right: 12,bottom: 12),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pop(context)
                        },
                        child: Container(
                          color: const Color.fromRGBO(71, 115, 200, 1),
                          child: const Center(
                            child:Text('完成',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),//底部的固定确认重置按钮
          ],
        ),
      ),
    );
  }
}
