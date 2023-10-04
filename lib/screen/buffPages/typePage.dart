import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../stateManage/stateManage.dart';
import '../../临时数据/测试.dart';
import '../../公共方法/selectOption.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key,});

  @override
  State<TypePage> createState() =>
      _State();
}

class _State extends State<TypePage> {
  bool allUnselect = true; //总类目的不限按钮触发

  //下面这些都是具体类目用于存放已选择的item，给显示变色用的
  List<String> knifeIndex = [];   //刀
  List<String> gloveIndex = [];    //手套
  List<String> pistolIndex = [];  //手枪
  List<String> submachineGunIndex = [];   //冲锋枪
  List<String> shotgunIndex = [];   //霰弹枪


  //总共已选择的选项
  List<String> selected = [];


  void resetAllList(){ //给总的不限按钮使用，快速清空所有显示的选择选项
    setState(() {
      selected = [];
      knifeIndex = [];
      gloveIndex = [];
      pistolIndex = [];
      submachineGunIndex = [];
      shotgunIndex = [];
    });
  }


  void checkUnselect([titleList]){
    if(selected.isEmpty){
      allUnselect = true;
      resetAllList();
      titleList.getColumNavigation[0] = '类型'; //重置右侧垂直导航的当前标题
      titleList.isChangeOrNot[0] = false; //把垂直导航的List的当前标题标记回false
    }else{
      allUnselect = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final titleList = Provider.of<TitleList>(context);
    // cont = context;
    return  Container(
      height: maxHeight,
      width: maxWidth,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: maxHeight * 0.1,
            width: maxWidth,
            color: Colors.white,
            padding: EdgeInsets.only(left: 12,top: maxHeight * 0.05),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text('类型',style: TextStyle(fontSize: 16),),
            ),
          ), //类型固定头部
          Expanded(
            child:CustomScrollView(
              slivers:<Widget> [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: SizedBox(
                          height: 35,
                          width: maxWidth,
                          // color: Colors.orange,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    resetAllList(); //清空所有已经选择过的选项
                                    checkUnselect(titleList);
                                    titleList.reFresh(); //手动通知页面刷新
                                  });
                                },
                                child:  Container(
                                  height: 35,
                                  width:  maxWidth * 0.4 - 17 ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: allUnselect? const Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                    border: Border.all(
                                      color: allUnselect? const Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text('不限',style: TextStyle(fontSize: 12, color: allUnselect ? Colors.white:Colors.grey, ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 1, // 设置子项数量
                  ),
                ), //总的不限按钮

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.pink,
                        padding: const EdgeInsets.all(12),
                        child: const Text('匕首',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), //匕首标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.red,
                        // alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: knife.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            // mainAxisExtent: 35,
                            childAspectRatio:4,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = knife[index];
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  knifeIndex = selectOption(item, knifeIndex, '匕首',titleList,selected,0);
                                  checkUnselect();
                                  // print(knifeIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: knifeIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: knifeIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text('${item}',style: TextStyle(fontSize: 12,color: knifeIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ), //匕首选择内容

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.all(12),
                        child: const Text('手套',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), // 手套标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: glove.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:1.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = glove[index];
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  gloveIndex = selectOption(item, gloveIndex, '手套',titleList,selected,0);
                                  checkUnselect();
                                  print(gloveIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: gloveIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: gloveIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text(item,style: TextStyle(fontSize: 12,color: gloveIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );

                    },
                    childCount: 1,
                  ),
                ), //手套选择内容

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.all(12),
                        child: const Text('手枪',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), // 手枪标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: pistol.length,  //list
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:1.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = pistol[index];  //list
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  pistolIndex = selectOption(item, pistolIndex, '手枪',titleList,selected,0);
                                  checkUnselect();
                                  print(pistolIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: pistolIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: pistolIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text('${item}',style: TextStyle(fontSize: 12,color: pistolIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );

                    },
                    childCount: 1,
                  ),
                ), //手枪选择内容


                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.all(12),
                        child: const Text('微型冲锋枪',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), // 冲锋枪标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: submachineGun.length,  //list
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:1.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = submachineGun[index];  //list
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  submachineGunIndex = selectOption(item, submachineGunIndex, '冲锋枪',titleList,selected,0);
                                  checkUnselect();
                                  // print(submachineGunIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: submachineGunIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: submachineGunIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text(item,style: TextStyle(fontSize: 12,color: submachineGunIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );

                    },
                    childCount: 1,
                  ),
                ), //冲锋枪选择内容

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.all(12),
                        child: const Text('霰弹枪',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), // 霰弹枪标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: shotgun.length,  //list
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:1.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = shotgun[index];  //list
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  shotgunIndex = selectOption(item, shotgunIndex, '霰弹枪',titleList,selected,0);
                                  checkUnselect();
                                  print(shotgunIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: shotgunIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: shotgunIndex.contains(item)? const Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text(item,style: TextStyle(fontSize: 12,color: shotgunIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );

                    },
                    childCount: 1,
                  ),
                ), //霰弹枪选择内容

              ],
            ),),  //可滚动选择选项区域
        ],
      ),
    ); //类型页面
  }
}