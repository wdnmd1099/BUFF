import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List gridList = [
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },
  {
    '磨损': '久经沙场',
    'ID': 'AK47|抽象派1337',
    '价钱': '144',
    '在售数量': '1000+',
    '图片地址': '',
  },

  // {'磨损':'','ID':'','价钱':'','在售数量':'','图片地址':'',},
];

Widget cont(context){
  double maxHeight = MediaQuery.of(context).size.height;
  double maxWidth = MediaQuery.of(context).size.width;

  return Container(
    height: 173,
    width: maxWidth,
    child: ListView(
      children: [
        Container(
          // color: Colors.red,
          height: 50,
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    height: 40,
                    color: Color.fromRGBO(240, 240, 240, 1),
                    child: Container(
                      // color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                            padding:
                            EdgeInsets.only(left: 4, right: 2, top: 2),
                            // color: Colors.purple,
                            child: Center(
                              child: Icon(
                                Icons.search,
                                size: 19,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            // color: Colors.yellow,
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              '搜索',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(162, 162, 162, 1)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 8),
                              alignment: Alignment.centerRight,
                              // color: Colors.green,
                              child: Icon(Icons.border_outer,
                                  size: 32,
                                  color: Color.fromRGBO(162, 162, 162, 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.green,
                padding: EdgeInsets.only(
                  right: 12,
                  left: 15,
                ),
                child: Icon(
                  Icons.accessibility,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ), //搜索框一栏
        Container(
          // color: Colors.red,
          height: 123,
          width: maxWidth,
          child: Row(
            children: [
              Container(
                width: maxWidth / 4,
                height: 143,
                padding:
                EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
                // color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.yellow,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(151, 64, 64, 1),
                                  Color.fromRGBO(200, 126, 125, 1)
                                ],
                              ),
                            ),
                            height: 30,
                            child: Text(
                              '印花搜枪',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: maxWidth / 4,
                padding:
                EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8),
                // color: Colors.grey,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(83, 146, 103, 1),
                                  Color.fromRGBO(125, 186, 146, 1)
                                ],
                              ),
                            ),
                            height: 30,
                            child: Text(
                              '类型筛选',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: maxWidth / 4,
                padding:
                EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8),
                // color: Colors.yellow,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(color: Colors.green),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(56, 88, 148, 1),
                                  Color.fromRGBO(152, 176, 212, 1)
                                ],
                              ),
                            ),
                            height: 30,
                            child: Text(
                              '汰换合同',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: maxWidth / 4,
                padding:
                EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 8),
                // color: Colors.purple,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(color: Colors.orange),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(245, 209, 130, 1),
                                  Color.fromRGBO(234, 222, 163, 1)
                                ],
                              ),
                            ),
                            height: 30,
                            child: Text(
                              '巴黎Major',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ), //四等分海报导航
      ],
    ),
  );
}