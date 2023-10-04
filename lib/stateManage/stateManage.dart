import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//登录状态管理，用于检测登录状态来拉取取餐页的订单数据
class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    // 登录逻辑
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // 登出逻辑
    _isLoggedIn = false;
    print(_isLoggedIn);
    notifyListeners();
  }
}

//遮罩对话框状态管理
class MaskDiaLog with ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void open() {
    // 登录逻辑
    _isOpen = true;
    notifyListeners();
  }

  void off() {
    // 登出逻辑
    _isOpen = false;
    notifyListeners();
  }
}

//typePage的右侧导航栏标题的状态管理
class TitleList with ChangeNotifier {
  // 选择选项的时候通过setList需要传入当前导航页的index和一个字符串，这个字符串就是已经选择的内容，下面叫这个选择的内容为titles
  // setList进行判断，有选择过的就会标记为true，把titles通过index找到对应的导航并覆盖到columNavigation[index]里，
  // 导航的组件通过遍历isChangeOrNot，遇到选过的就在columNavigation里拿，没有选过的，就从rawNavigation里拿，保证选过的是显示titles，没选过的是原始的标题
  // 目的是实现选过的titles要显示橙色，然后当前选中但没有titles的导航标题要显示黑色，当前未选中且无titles的要显示灰色，实现三色互换。
  // 并且可以通过isChangeOrNot的ture或false获取选择好的选项当已选条件给完成按钮发请求
  List rawNavigation = ['类型','热门皮肤','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
  List columNavigation = ['类型','热门皮肤','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
  List isChangeOrNot = [false,false,false,false,false,false,false,false,false,false,false];

  List get getIsChangeOrNot => isChangeOrNot;
  List get getColumNavigation => columNavigation;

  reset(){
    columNavigation = ['类型','热门皮肤','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
    isChangeOrNot = [false,false,false,false,false,false,false,false,false,false,false];
    notifyListeners();
  }

  reFresh(){ //给修改引用传递但是不能触发 notifyListeners(); 的操作使用从而手动刷新页面
    notifyListeners();
  }

  setList(int index,String titles){
    if(titles.isNotEmpty){
      isChangeOrNot[index] = true;
      columNavigation[index] = titles;
      print(columNavigation);
    }else{
      isChangeOrNot[index] = false;
      columNavigation[index] = rawNavigation[index];
    }
    notifyListeners();
  }
}


//选择印花的状态管理
class PrintFlower with ChangeNotifier {
  List selectedFlower = [];

  List get getSelectedFlower => selectedFlower;

  void pushFlower(value) {
    selectedFlower.add(value);
    notifyListeners();
  }

  void delFlower(int i){
    selectedFlower.removeAt(i);
    notifyListeners();
  }

  void reset(){
    selectedFlower = [];
    notifyListeners();
  }

  void reFresh() {
    notifyListeners();
  }
}
























