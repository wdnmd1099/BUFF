import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee/screen/buffPages/popularSkin.dart';
import 'package:coffee/screen/buffPages/printed.dart';
import 'package:coffee/screen/buffPages/typePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../stateManage/stateManage.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _State();
}

class _State extends State<SeachPage> {
  int currentIndex = 2;      //indexStack的index

  @override
  void dispose () {
    super.dispose();
    //页面销毁时清空选择的数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TitleList>(globalContext,listen:false).reset();
      Provider.of<PrintFlower>(globalContext,listen: false).reset();
      print('已销毁');
    });
  }



  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final titleList = Provider.of<TitleList>(context);
    final printFlower = Provider.of<PrintFlower>(context);

    List isChangeOrNot  = titleList.getIsChangeOrNot;
    List columNavigation = titleList.getColumNavigation;

    getPrintFlower(int i){
      if(i != 2){
        return columNavigation[i];
      }else if(i==2){
        if(isChangeOrNot[2] == true){
          return '自定义印花';
        }else if(isChangeOrNot[2] == false){
          return '已贴印花';
        }
      }
    }



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


                         PopularSkin(),//热门皮肤


                         Printed(),

                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.red,
                          ),
                          Container(
                            height: maxHeight,
                            width: maxWidth,
                            color: Colors.blue,
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
                        for(int i=0;i<isChangeOrNot.length;i++)
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                currentIndex = i;
                              });
                            },
                            child:Container(
                              child:  Container(
                                height: (maxHeight * 0.9) / 9.2,
                                width: maxWidth * 0.2,
                                padding: EdgeInsets.only(left: 8,right: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    left: BorderSide(
                                      color: currentIndex == i? Colors.white:Colors.grey,
                                      width: 1,
                                    ),
                                    top: currentIndex == i? const BorderSide(
                                      color:Colors.grey,
                                      width: 1,
                                    ):BorderSide.none,
                                    bottom: currentIndex == i? const BorderSide(
                                      color:Colors.grey,
                                      width: 1,
                                    ):BorderSide.none,
                                  ),
                                ),
                                child: Center(
                                  child:isChangeOrNot[i] == false?
                                      // 做判断，如果已贴印花已选，显示的是自定义但是实际数据是要写选择的印花
                                  Text(
                                    '${columNavigation[i]}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: currentIndex == i? Colors.black : const Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ):
                                  AutoSizeText(
                                    getPrintFlower(i),
                                      maxLines: 3,
                                      minFontSize: 12,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.orange,
                                        overflow: TextOverflow.ellipsis,
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
                          onTap: (){
                            //重置是直接跳页面的，跳完即使再调用本地的数据也重置了。
                            titleList.reset();
                            printFlower.reset();
                          },
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
                        onTap: (){
                          List selectedOption = titleList.isChangeOrNot;
                          List mid = [];
                          for(int i =0;i<selectedOption.length;i++){
                            if(selectedOption[i] == true){
                              mid.add(titleList.getColumNavigation[i]);
                            }
                          }
                          titleList.reset();
                          print('来自seachPage的打印：$mid');
                          Navigator.pop(context);
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
