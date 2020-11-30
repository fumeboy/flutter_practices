import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UsersItem("./images/a1.jpg", 'Puk Surya',
            'Puk Surya Puk Surya Puk Surya...', "20 Mar 19", "3", true),
        UsersItem("./images/a3.jpeg", 'Puk Surya',
            'Puk Surya Puk Surya Puk Surya...', "20 Mar 19", "3", false),
        UsersItem("./images/a4.jpeg", 'Puk Surya',
            'Puk Surya Puk Surya Puk Surya...', "20 Mar 19", "3", true),
        UsersItem("./images/a1.jpg", 'Puk Surya',
            'Puk Surya Puk Surya Puk Surya...', "20 Mar 19", "3", true),
        UsersItem("./images/a4.jpeg", 'Puk Surya',
            'Puk Surya Puk Surya Puk Surya...', "20 Mar 19", "3", false),
      ],
    );
  }
}

class UsersItem extends StatefulWidget {
  UsersItem(
      this.img, this.title, this.description, this.time, this.num, this.online);

  final String img;
  final String title;
  final String description;
  final String time;
  final String num;
  final bool online;

  @override
  _UsersItemState createState() => _UsersItemState();
}

class _UsersItemState extends State<UsersItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final UsersItem = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        // .padding(vertical: 12)
        .ripple()
        // margin
        .backgroundColor(Colors.white, animate: true)
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => print('onTap'),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget Avatar = Stack(
      overflow: Overflow.clip,
      children: [
        Image.asset(
          widget.img,
          fit: BoxFit.fill,
          height: 60,
          width: 60,
        )
            // .padding(all: 12)
            .clipRRect(all: 5)
            .padding(all: 10),
        widget.online
            ? Positioned(
                right: 15,
                bottom: 15,
                child: Container(
                  width: 5,
                  height: 5,
                ).decorated(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)))
            : Positioned(
                right: 15,
                bottom: 15,
                child: Container(
                  width: 5,
                  height: 5,
                ).decorated(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)))
      ],
    );

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    final Widget time = Text(
      widget.time,
      style: TextStyle(
        fontSize: 12,
      ),
    ).padding(bottom: 5);

    final Widget num = Text(
      widget.num,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    )
        .padding(horizontal: 10, vertical: 5)
        .decorated(borderRadius: BorderRadius.circular(20), color: Colors.grey);

    return UsersItem(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          <Widget>[
            Row(
              children: [
                Avatar,
                <Widget>[
                  title,
                  description,
                ].toColumn(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [time, num],
            ).padding(right: 20)
          ]
              .toRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
              .constrained(width: MediaQuery.of(context).size.width)
              .decorated(color: Colors.white),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete_forever),
            onPressed: () => {},
            padding: EdgeInsets.all(20),
          )
        ],
      )
          .decorated(color: Colors.orangeAccent[200])
          .scrollable(scrollDirection: Axis.horizontal),
    );
  }
}
