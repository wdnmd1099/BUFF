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
