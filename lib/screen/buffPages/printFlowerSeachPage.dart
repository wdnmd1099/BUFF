import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../stateManage/stateManage.dart';

class PrintFlowerSeachPage extends StatefulWidget {
  const PrintFlowerSeachPage({super.key});

  @override
  State<PrintFlowerSeachPage> createState() => _State();
}

class _State extends State<PrintFlowerSeachPage> {
  List printFlowerList = [
    '23巴黎',
    '间谍',
    '22里约',
    '十周年',
    '22安特卫普',
    '作战室',
    '战地2042',
    '21斯德哥尔摩',
    '激流冲浪店',
    '激流大行动',
    '2021社区'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final printFlower = Provider.of<PrintFlower>(context);
    final titleList = Provider.of<TitleList>(context);
    List selectList = printFlower.getSelectedFlower;

    String backIcon =
        '<svg t="1696401542618" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8224" width="200" height="200"><path d="M914.6 468.1H219.2l287.2-287.2c17.7-17.7 17.7-46.7 0-64.4-17.7-17.7-46.7-17.7-64.4 0l-365 365c-17.7 17.7-17.7 46.7 0 64.4l365 365c17.7 17.7 46.7 17.7 64.4 0 17.7-17.7 17.7-46.7 0-64.4L219.2 559.1h695.4c25.1 0 45.5-20.5 45.5-45.5 0-25.1-20.5-45.5-45.5-45.5z" fill="#2c2c2c" p-id="8225"></path></svg>';

    return Container(
      height: maxHeight,
      width: maxWidth,
      color: Colors.white,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
          child: AppBar(
            backgroundColor: Colors.grey[200],
            shadowColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    height: 33,
                    width: 33,
                    color: Colors.red,
                    child: SvgPicture.string(
                      backIcon,
                      // colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate),
                      width: 22.0,
                      height: 22.0,
                    ),
                  ),
                ],
              ),
            ),
            title: Container(), //搜索框
          ),
        ),
        body: Container(
          height: maxHeight,
          width: maxWidth,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                width: maxWidth * 0.25,
                height: maxHeight,
                color: Colors.white,
                child: ListView(
                  children: [
                    for (int i = 0; i < printFlowerList.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 0.5,
                                color: i == currentIndex
                                    ? Colors.transparent
                                    : Colors.grey,
                              ),
                              top: i == currentIndex?const BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              ):BorderSide.none,

                              bottom: i == currentIndex?const BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              ):BorderSide.none,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${printFlowerList[i]}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ), //左侧纵向导航栏
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: maxHeight,
                  width: maxWidth,
                  child: IndexedStack(
                    index: currentIndex,
                    children: [
                      for (int i = 0; i < 11; i++)
                        Container(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 12),
                            child: ListView(
                              children: [
                                for (int i = 0; i < 16; i++)
                                  GestureDetector(
                                    onTap: (){
                                      if(printFlower.getSelectedFlower.length < 4){
                                        printFlower.pushFlower({'color':Colors.amber,'title':'"2022 激流大行动斯德哥尔摩裂网大行动"'},);
                                        titleList.setList(2, '"2022 激流大行动斯德哥尔摩裂网大行动"');
                                      }
                                     print(printFlower.getSelectedFlower.length);
                                      },
                                    child:Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 12, top: 12),
                                      height: 72,
                                      width: maxWidth,
                                      decoration: const BoxDecoration(
                                        // color: Colors.red,
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromRGBO(240, 240, 240, 1),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            color: Colors.amber,
                                            height: 60,
                                            width: 90,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                              const EdgeInsets.only(left: 12),
                                              child: const Text(
                                                '"2022 激流大行动斯德哥尔摩裂网大行动"',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                          ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
