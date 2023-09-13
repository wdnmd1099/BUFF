import 'package:coffee/screen/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuffPage extends StatefulWidget {
  const BuffPage({super.key});

  @override
  State<BuffPage> createState() => _BuffPageState();
}

class _BuffPageState extends State<BuffPage> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    String icon =
        '<svg t="1694511174294" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4019" data-spm-anchor-id="a313x.search_index.0.i0.52d03a811UcVFI" width="200" height="200"><path d="M877.714286 0H146.285714C65.828571 0 0 65.828571 0 146.285714v731.428572c0 80.457143 65.828571 146.285714 146.285714 146.285714h731.428572c80.457143 0 146.285714-65.828571 146.285714-146.285714V146.285714c0-80.457143-65.828571-146.285714-146.285714-146.285714z m-95.085715 212.114286V219.428571h-73.142857l-29.257143 29.257143 7.314286 51.2h-7.314286s-7.314286 29.257143-14.628571 43.885715c-7.314286 7.314286-21.942857 58.514286-124.342857-7.314286 0 0-14.628571 21.942857 7.314286 36.571428v87.771429s0 21.942857-29.257143 14.628571v29.257143s58.514286 43.885714 87.771428 153.6v146.285715h-7.314285v51.2s21.942857 29.257143 36.571428 36.571428c7.314286 0 29.257143 0 36.571429 29.257143v7.314286H533.942857v-43.885715c7.314286-14.628571 7.314286-21.942857 7.314286-21.942857v-51.2h-7.314286s-21.942857-51.2-7.314286-102.4c7.314286 0 0-36.571429 0-36.571428h-21.942857l-51.2-65.828572-21.942857-7.314285V585.142857s-21.942857 7.314286-51.2 95.085714c0 7.314286 0 7.314286-7.314286 7.314286s-36.571429 29.257143-36.571428 43.885714c0 0 0 36.571429-7.314286 43.885715-7.314286 7.314286-14.628571 21.942857-21.942857 51.2 0 7.314286 0 7.314286-14.628571 14.628571-7.314286 0-29.257143 36.571429-14.628572 80.457143H292.571429v29.257143H219.428571v-58.514286s14.628571 7.314286 21.942858-65.828571c0 0-14.628571-21.942857 7.314285-58.514286 0-7.314286 7.314286-29.257143 7.314286-29.257143s7.314286-36.571429 36.571429-58.514286c0-7.314286 7.314286-117.028571 7.314285-117.028571l-7.314285 7.314286v-21.942857h7.314285v-7.314286L292.571429 533.942857v-29.257143h14.628571v-36.571428s-14.628571-7.314286 0-43.885715c7.314286 0 21.942857-7.314286 14.628571-7.314285-7.314286 0-21.942857-7.314286-21.942857-7.314286l7.314286-87.771429h36.571429V234.057143s14.628571-51.2 51.2-58.514286h36.571428v-7.314286s-14.628571-73.142857 58.514286-87.771428c7.314286 0 87.771429 7.314286 58.514286 80.457143l-7.314286 7.314285v21.942858s14.628571 7.314286 43.885714-7.314286v-21.942857h7.314286v21.942857h190.171428v-21.942857h14.628572v29.257143h14.628571v14.628571h51.2l7.314286-7.314286h36.571429v14.628572h-124.342858z" fill="#F8AC33" p-id="4020"></path></svg>';
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
          child: AppBar(
            titleSpacing: 0,
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            shadowColor: Colors.transparent,
            // leading:Container(color: Colors.orange,),
            title: Container(
              color: Color.fromRGBO(250, 250, 250, 1),  //Color.fromRGBO(250, 250, 250, 1)
              height: maxHeight,
              width: maxWidth,
              child: const Row(
                children: [
                  Expanded(
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Color.fromRGBO(62, 62, 62,1),
                      unselectedLabelColor: Color.fromRGBO(188, 188, 188,1),
                      labelStyle: TextStyle(fontSize: 18),
                      unselectedLabelStyle: TextStyle(fontSize: 14),
                      indicatorWeight: 0.001,
                      isScrollable: true,
                      tabs: [
                        Text('首页'),
                        Text('热门关注'),
                        Text('趋势榜单'),
                        Text('特殊磨损'),
                        Text('金贴专区'),
                        Text('近期降价'),
                        Text('四连贴纸'),
                        Text('低磨专区'),
                        Text('宝石刀'),
                        Text('打包专区'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                   Center(
                    child:GestureDetector(
                      onTap: ()=>{  test()  },
                      child: Container(
                        height: maxHeight,
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.menu,color: Colors.grey,size: 14,),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(right: 12,left: 8),
                      child: SvgPicture.string(
                        icon, // 替换为您自己的 SVG 图像路径
                        width: 20.0, // 设置 SVG 图像的宽度
                        height: 20.0, // 设置 SVG 图像的高度
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstPage(),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
          ],
        ),
      ),
    );
  }
}

void test(){
  print('qifei');
}