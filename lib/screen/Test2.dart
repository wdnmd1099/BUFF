import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _listScrollController = ScrollController(); // 为 ListView 创建独立的 ScrollController



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Scrollbar(
                    controller: _scrollController,
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: ListView.builder(
                      controller: _listScrollController, // 使用单独的 ScrollController
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
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
