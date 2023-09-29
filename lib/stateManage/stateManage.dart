import 'package:flutter/cupertino.dart';


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
  List rawNavigation = ['类型','热门内容','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
  List columNavigation = ['类型','热门内容','已贴印花','赛事选手','品质','类别','外观','收藏品','颜色','排序','价格区间',];
  List isChangeOrNot = [false,false,false,false,false,false,false,false,false,false,false];

  List get getIsChangeOrNot => isChangeOrNot;
  List get getColumNavigation => columNavigation;

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