import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../stateManage/stateManage.dart';

List<String> selectOption(String item,List<String> middleList,String title,TitleList titleList,List selected,int titleListIndex){

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

  titleList.setList(titleListIndex, selectedTitles);

  return middleList;
}