import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../临时数据/测试.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _State();
}

class _State extends State<SeachPage> {
  int currentIndex = 0;
  List<int> knifeIndex = [];
  List<int> gloveIndex = [];

  List<String> selected = [];




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
                                                    Container(
                                                      height: 35,
                                                      width:  maxWidth * 0.4 - 17 ,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: Colors.transparent,
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text('不限',style: TextStyle(fontSize: 12,color:Colors.grey),),
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
                                              // color: Colors.red,
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
                                              padding: EdgeInsets.only(left: 12,right: 12),
                                              child: GridView.builder(
                                                itemCount: knife.length,
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
                                                  var item = knife[index];
                                                  return GestureDetector(
                                                    onTap: (){
                                                      setState(() {
                                                        //少于5个添加，等于或多于就提示
                                                        //三元运算就在外面写一个返回bool的函数给它调用就行了
                                                        bool isNumberInArray = knifeIndex.contains(index);
                                                        //点击的选项如果存在于列表证明是已经点击过的，就删除它
                                                        if(isNumberInArray){
                                                          knifeIndex.remove(index);
                                                          selected.remove(item);
                                                        }
                                                        //如果不存在并且列表数少于5个，就加入它
                                                        else if(selected.length < 5){
                                                          knifeIndex.add(index);
                                                          selected.add(item);
                                                        }else if(knifeIndex.length == 5){
                                                          BotToast.showText(text:"最多只能选择五项",textStyle: TextStyle(fontSize: 12,color: Colors.white));
                                                        }
                                                        //首次默认是不限，如果点击其它需要先把不限删除
                                                        if(knifeIndex.length > 0){
                                                          knifeIndex.remove(0);
                                                          selected.remove(knife[0]);
                                                        }
                                                        //如果点击的是不限，那么要删除其它已选的选项
                                                        if(index == 0){
                                                          knifeIndex = [0];
                                                          selected = ['不限'];
                                                        }

                                                        // print(knifeIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: knifeIndex.contains(index)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: knifeIndex.contains(index)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Text('${item}',style: TextStyle(fontSize: 12,color: knifeIndex.contains(index)? Colors.white:Colors.grey),),
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
                                      ), //手套标题
                                      SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                              (BuildContext context, int index) {
                                            return Container(
                                              padding: EdgeInsets.only(left: 12,right: 12),
                                              child: GridView.builder(
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
                                                        //少于5个添加，等于或多于就提示
                                                        //三元运算就在外面写一个返回bool的函数给它调用就行了
                                                        bool isNumberInArray = gloveIndex.contains(index);
                                                        //点击的选项如果存在于列表证明是已经点击过的，就删除它
                                                        if(isNumberInArray){
                                                          gloveIndex.remove(index);
                                                          selected.remove(item);
                                                        }
                                                        //如果不存在并且列表数少于5个，就加入它
                                                        else if(gloveIndex.length < 5){
                                                          gloveIndex.add(index);
                                                          selected.add(item);
                                                        }else if(gloveIndex.length == 5){
                                                          BotToast.showText(text:"最多只能选择五项",textStyle: TextStyle(fontSize: 12,color: Colors.white));
                                                        }
                                                        //首次默认是不限，如果点击其它需要先把不限删除
                                                        if(gloveIndex.length > 0){
                                                          gloveIndex.remove(0);
                                                          selected.remove(knife[0]);
                                                        }
                                                        //如果点击的是不限，那么要删除其它已选的选项
                                                        if(index == 0){
                                                          gloveIndex = [0];
                                                          selected = ['不限'];
                                                        }

                                                        // print(knifeIndex);
                                                        print(selected);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        color: knifeIndex.contains(index)? Color.fromRGBO(238, 162, 14, 1):Colors.white,
                                                        border: Border.all(
                                                          color: knifeIndex.contains(index)? Color.fromRGBO(238, 162, 14, 1):Colors.grey,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Text('${item}',style: TextStyle(fontSize: 12,color: knifeIndex.contains(index)? Colors.white:Colors.grey),),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );

                                          },
                                          childCount: 1,
                                        ),
                                      ), //手套选择内容


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
                                                        // borderRadius: BorderRadius.circular(4),
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
                                                          style: const TextStyle(
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
