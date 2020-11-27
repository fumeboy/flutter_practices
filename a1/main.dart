import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() {
  runApp(Main());
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
                Text("find topics that you like to read")
                    .textColor(Colors.grey[200])
                    .fontSize(16),
              ],
            ).padding(all: 20),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 44.0),
                  enabledBorder: OutlineInputBorder(
                      /*边角*/
                      borderRadius: BorderRadius.all(
                        Radius.circular(5), //边角为5
                      ),
                      borderSide: BorderSide.none),
                  labelText: "search ...",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.search)),
            )
                .constrained(width: MediaQuery.of(context).size.width)
                .decorated(color: Colors.blue[50]),
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
              Text("热门板块")
                  .textColor(Colors.black)
                  .fontSize(24)
                  .padding(left: 20),
              Row(
                children: [
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                ],
              ).scrollable(scrollDirection: Axis.horizontal)
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
              .padding(top: MediaQuery.of(context).size.height)
              .scrollable(),
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("C++").fontSize(20).fontWeight(FontWeight.bold),
        Text("在线人数 238"),
      ],
    )
        .padding(all: 10)
        .constrained(width: 100, height: 100)
        .decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        )
        .padding(all: 10);
  }
}
