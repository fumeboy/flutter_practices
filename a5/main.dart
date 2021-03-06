import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

import 'UserList.dart';

void main() {
  runApp(Main());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('test');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: UserPage(),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.clip,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("嗨！fumeboy").textColor(Colors.white).fontSize(48),
              ],
            ).padding(all: 20),
          ],
        )
            .padding(top: 100)
            .constrained(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height)
            .decorated(color: Colors.blue[800]),
        Positioned(
          left: 0,
          top: 0,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 6,
                width: MediaQuery.of(context).size.width / 6,
              )
                  .decorated(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(22),
                  )
                  .center()
                  .padding(bottom: 15),
              Text("Chat")
                  .textColor(Colors.black)
                  .fontSize(24)
                  .padding(left: 20, bottom: 20),
              Users()
            ],
          )
              .padding(top: 15)
              .decorated(color: Color(0xfff2f6fa))
              .constrained(
                width: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              )
              .padding(top: MediaQuery.of(context).size.height / 2.0)
              .scrollable(),
        )
      ],
    );
  }
}
