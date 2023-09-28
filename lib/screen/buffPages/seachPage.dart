import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../../临时数据/测试.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _State();
}

class _State extends State<SeachPage> {
  int currentIndex = 0;      //indexStack的index
  bool allUnselect = true; //总类目的不限按钮触发

  //下面这些都是具体类目用于存放已选择的item，给显示变色用的
  List<String> knifeIndex = [];
  List<String> gloveIndex = [];
  List<String> pistolIndex = [];
  List<String> submachineGunIndex = [];
  List<String> shotgunIndex = [];



  //总共已选择的选项
  List<String> selected = [];

  List<String> test(String item,List<String> middleList,String title){
    // 检查当前点击元素是否已经存在于数组
    bool isItemInArray = middleList.contains(item);

    if(item == '不限'){
      // 如果点击的是不限，就把该类目的所有已选择元素从selected中删除
      for(int i=0;i<middleList.length;i++){
        for(int x=0;x<selected.length;x++){
          if(middleList[i] == selected[x]){
            selected.remove(selected[x]);
          }
        }
      }


      List allNone = [];
      // 如果
      for(int x=0;x<selected.length;x++) {
        if(selected[x] == title){

        }else if(selected[x] != title){
          allNone.add(false);
        }
      }

      if(allNone.length == selected.length){
        selected.add(title);
      }
      middleList = ['不限'];
    }


    //若已存在，删除
    if(isItemInArray){
      middleList.remove(item);
      selected.remove(item);
      //如果再次点击的是不限，那么就要把selected的title也删除
      if(item == '不限'){
        selected.remove(title);
      }
    }
    //若不存在
    else if(selected.length < 5){
      if(item != '不限'){
        //如果点击的元素不是不限，就检查元素里有没有不限，有就删除
        for(int i=0;i<middleList.length;i++){
          if(middleList[i] == '不限'){
            middleList.remove(middleList[i]);
          }
        }
        //如果里面有该总类目，就删除该总类目，以防止点击不限后再点其它非不限元素时，该类目依然存在于selected
        for(int i=0;i<selected.length;i++){
          if(selected[i] == title){
            selected.remove(selected[i]);
          }
        }
        //然后添加点击的元素
        middleList.add(item);
        selected.add(item);
      }


    }else if(selected.length == 5){
      if(selected[selected.length-1] == title){

      }else{
        BotToast.showText(text:"最多只能选择五项",textStyle: TextStyle(fontSize: 12,color: Colors.white));
      }

    }

    return middleList;
  }

  void checkUnselect(){
    if(selected.isEmpty){
      allUnselect = true;
    }else{
      allUnselect = false;
    }
  }




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
                          Container(
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
                                    child: Text('类型',style: TextStyle(fontSize: 16),),
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
                                              child: Container(
                                                height: 40,
                                                width: maxWidth,
                                                // color: Colors.orange,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:(){

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
                                      ), //单独的不限按钮
                                      SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                              (BuildContext context, int index) {
                                            return Container(
                                              // color: Colors.pink,
                                              padding: EdgeInsets.all(12),
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
                                                padding: EdgeInsets.all(0),
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
                                                       knifeIndex = test(item, knifeIndex, '匕首');
                                                       checkUnselect();
                                                        print(knifeIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: knifeIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: knifeIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
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
                                              padding: EdgeInsets.all(12),
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
                                              padding: EdgeInsets.only(left: 12,right: 12),
                                              child: GridView.builder(
                                                padding: EdgeInsets.all(0),
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
                                                        gloveIndex = test(item, gloveIndex, '手套');
                                                        checkUnselect();
                                                        print(gloveIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: gloveIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: gloveIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Text('${item}',style: TextStyle(fontSize: 12,color: gloveIndex.contains(item)? Colors.white:Colors.grey),),
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
                                              padding: EdgeInsets.all(12),
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
                                                        pistolIndex = test(item, pistolIndex, '手枪');
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
                                              padding: EdgeInsets.all(12),
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
                                              padding: EdgeInsets.only(left: 12,right: 12),
                                              child: GridView.builder(
                                                padding: EdgeInsets.all(0),
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
                                                        submachineGunIndex = test(item, submachineGunIndex, '冲锋枪');
                                                        checkUnselect();
                                                        print(submachineGunIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: submachineGunIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: submachineGunIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Text('${item}',style: TextStyle(fontSize: 12,color: submachineGunIndex.contains(item)? Colors.white:Colors.grey),),
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
                                              padding: EdgeInsets.all(12),
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
                                                        shotgunIndex = test(item, shotgunIndex, '霰弹枪');
                                                        checkUnselect();
                                                        print(shotgunIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: shotgunIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: shotgunIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Text('${item}',style: TextStyle(fontSize: 12,color: shotgunIndex.contains(item)? Colors.white:Colors.grey),),
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
                          ),//类型页面




































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
                                      color: currentIndex == i? Colors.black : Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
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
