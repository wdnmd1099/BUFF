import 'package:flutter/material.dart';

import '../临时数据/测试.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _State();
}

class _State extends State<SeachPage> {
  int currentIndex = 0;
  int knifeIndex = 0;
  List knife = [
    '不限','蝴蝶刀','M9刺刀','爪子刀','骷髅匕首','刺刀','锯齿爪刀','流浪者匕首','折叠刀','短剑','海报短刀','熊刀','猎杀者匕首','系绳匕首','求生匕首','弯刀','暗影双匕','鲍伊猎刀','穿肠刀','折刀',
  ];
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;


    return Material(
      child: Container(
        height: maxHeight,
        width: maxWidth,
        color: Colors.white,
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
                          ),
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
                                              Container(
                                                height: 40,
                                                width:  maxWidth * 0.4 - 18 ,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('不限',),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    childCount: 1, // 设置子项数量
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return Container(
                                          padding: EdgeInsets.all(12),
                                          child: GridView.builder(
                                            itemCount: knife.length,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 45,
                                              // childAspectRatio:1.2,
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
                                                    knifeIndex = index;
                                                    print(knifeIndex);
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: knifeIndex == index? Colors.orange:Colors.white,
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Text('${item}'),
                                                ),
                                              );
                                            },
                                          ),
                                        );

                                    },
                                    childCount: 1,
                                  ),
                                ),




                                SliverPadding(padding: EdgeInsets.all(60)),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Container(
                                          height: maxHeight,
                                          child: GridView.builder(
                                            itemCount: knife.length,  //要遍历的数组的长度
                                            physics: NeverScrollableScrollPhysics(),

                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 50, //元素的高
                                              crossAxisCount: 2, // 每一行的子项数量
                                              mainAxisSpacing: 10, //间距
                                              crossAxisSpacing: 10, //间距
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              var item = knife[index]; //定义每一个遍历的元素
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${item}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            // 子项的总数量
                                          ),
                                        ),
                                      );
                                    },
                                    childCount: 1, // 设置子项数量
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.all(12),
                                        child: Container(
                                          height: maxHeight,
                                          child: GridView.builder(
                                            itemCount: knife.length,
                                            physics: NeverScrollableScrollPhysics(),

                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2, // 每一行的子项数量
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              var item = knife[index];
                                              return Container(
                                                color: Colors.blue,
                                                child: Center(
                                                  child: Text(
                                                    '${item}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            // 子项的总数量
                                          ),
                                        ),
                                      );

                                    },
                                    childCount: 1, // 设置子项数量
                                  ),
                                ),
                              ],
                          ),),
                        ],
                      ),
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
              height: maxHeight,
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
                            height: maxHeight * 0.1,
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
    );
  }
}
