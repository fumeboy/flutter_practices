import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

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
              Text("Tags")
                  .textColor(Colors.black)
                  .fontSize(24)
                  .padding(left: 20),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 6.0, // 纵轴（垂直）方向间距
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Tag(
                    Icons.location_on,
                    Color(0xffac55a6),
                    'Address',
                  ),
                  Tag(
                    null,
                    Color(0xffac55a6),
                    'Address',
                  ),
                  Tag(
                    null,
                    Color(0xff7ec2b3),
                    'Bahass Indonesia',
                  ),
                  Tag(
                    null,
                    Color(0xff6677ad),
                    '埃塞俄比亚',
                  ),
                  Tag(
                    null,
                    Colors.red,
                    'RED!',
                  ),
                  Tag(
                    null,
                    Color(0xff6677ad),
                    'emoji 🇨🇳',
                  ),
                ],
              ).padding(all: 12),
            ],
          )
              .padding(top: 30)
              .decorated(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xfff2f6fa))
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

class Tag extends StatefulWidget {
  Tag(this.icon, this.iconBgColor, this.text);

  final IconData icon;
  final Color iconBgColor;
  final String text;

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final ret = ({Widget child}) => Styled.widget(child: child)
        .backgroundColor(widget.iconBgColor.withAlpha(50), animate: true)
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget text = Text(
      widget.text,
      style: TextStyle(fontSize: 16, color: widget.iconBgColor, height: 1.2),
    );

    return ret(
      child: (widget.icon == null
              ? <Widget>[
                  text,
                ]
              : <Widget>[
                  Icon(widget.icon, size: 14, color: widget.iconBgColor)
                      .padding(right: 3),
                  text,
                ])
          .toRow(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center
          )
          .padding(vertical: 4, horizontal: 12),
    );
  }
}
