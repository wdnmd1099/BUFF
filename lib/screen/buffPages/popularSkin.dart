import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../stateManage/stateManage.dart';

class PopularSkin extends StatefulWidget {
  PopularSkin({super.key,});

  @override
  State<PopularSkin> createState() =>
      _State();
}

class _State extends State<PopularSkin> {
  List popularKnifes = ['深红之网','表面淬火','渐变大理石','多普勒','渐变之色','无涂装','自动化','屠夫','虎牙','伽玛多普勒','传说','大马士革钢','外表生锈','致命紫罗兰',];
  List weapon = ['二西莫夫','黑色魅影','印花集','表面淬火','塔罗牌','血腥运动','机械革命','渐变之色','深红之网','精英之作',];
  bool allUnselect = true; //总类目的不限按钮触发

  //下面这些都是具体类目用于存放已选择的item，给显示变色用的
  List<String> knifeIndex = [];   //刀
  List<String> weaponIndex = [];    //武器

  //总共已选择的选项
  List<String> selected = [];


  List<String> selectOption(String item,List<String> middleList,String title,TitleList titleList){

    // 检查当前点击元素是否已经存在于数组
    bool isItemInArray = middleList.contains(item);
    List allNone = [];

    if(item == '不限'){
      // 如果点击的是不限，就把该类目的所有已选择元素从selected中删除
      for(int i=0;i<middleList.length;i++){
        for(int x=0;x<selected.length;x++){
          if(middleList[i] == selected[x]){
            selected.remove(selected[x]);
          }
        }
      }
      // 如果title已被添加，就什么都不做，如果没有添加，则要看列表是否全部都没有添加过，全部没有的话标记为没有，在下面处理添加逻辑
      for(int x=0;x<selected.length;x++) {
        if(selected[x] == title){
          //什么都不做
        }else if(selected[x] != title){
          allNone.add(false);
        }
      }
    }

    //若当前点击元素已存在，删除
    if(isItemInArray){
      middleList.remove(item);
      selected.remove(item);
      //如果再次点击的是不限，那么就要把selected的title也删除
      if(item == '不限'){
        selected.remove(title);
      }
    }
    //若当前点击元素不存在
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
      }else if(item == '不限'){
        //把点击不限后添加总类目的逻辑放到这里，如果放到上面的不限类目，会先添加再判断是否为5个，这样第五个选择不限时会预期外地跳出提示
        if(allNone.length == selected.length){
          selected.add(title);
        }
        middleList = ['不限'];
      }
    }else if(selected.length == 5){
      //如果此时selected的第5个是总类目的话，说明用户需要点击其它选项，放弃不限，所以需要删除不限添加用户点击的选项
      //这样可以修复当用户点击不限后，想再选取其它选项时跳提示。
      if(selected[4] == title){
        selected.remove(selected[4]);
        middleList = [];
        middleList.add(item);
        selected.add(item);
      }else{
        BotToast.showText(text:"最多只能选择五项",textStyle: TextStyle(fontSize: 12,color: Colors.white));
      }

    }


    String selectedTitles = selected.join(',');
    // print(selectedTitles.isEmpty);

    titleList.setList(1, selectedTitles);

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
    final titleList = Provider.of<TitleList>(context);

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
              child: const Text('热门皮肤',style: TextStyle(fontSize: 16),),
            ),
          ), //类型固定头部
          Expanded(
            child:CustomScrollView(
              slivers:<Widget> [
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
                          itemCount: popularKnifes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:4,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = popularKnifes[index];
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  knifeIndex = selectOption(item, knifeIndex, '匕首',titleList);
                                  checkUnselect();
                                  // print(knifeIndex);
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
                        child: const Text('武器',style: TextStyle(fontSize: 12,color: Color.fromRGBO(83, 124, 204, 1)),),
                      );
                    },
                    childCount: 1,
                  ),
                ), // 武器标题
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 12,right: 12),
                        child: GridView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: weapon.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 35,
                            // childAspectRatio:1.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // print(maxHeight);
                            var item = weapon[index];
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  weaponIndex = selectOption(item, weaponIndex, '武器',titleList);
                                  checkUnselect();
                                  print(weaponIndex);
                                  print(selected);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: weaponIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                  border: Border.all(
                                    color: weaponIndex.contains(item)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                child: Text('${item}',style: TextStyle(fontSize: 12,color: weaponIndex.contains(item)? Colors.white:Colors.grey),),
                              ),
                            );
                          },
                        ),
                      );

                    },
                    childCount: 1,
                  ),
                ), //手套选择内容


              ],
            ),),  //可滚动选择选项区域
        ],
      ),
    ); //类型页面
  }
}