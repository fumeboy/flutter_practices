import 'package:flutter/material.dart';
import 'package:flutter_app/tag.dart';
import 'package:styled_widget/styled_widget.dart';

class CardA extends StatelessWidget {
  final Tag tag;
  final String title, date;

  const CardA(this.title, this.tag, this.date, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title).textColor(Colors.black).fontSize(24).padding(bottom: 6),
            tag,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Due Date").textColor(Colors.grey).fontSize(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_sharp,
                  color: Colors.grey[300],
                ),
                Text(date)
                    .textColor(Colors.grey)
                    .fontSize(16)
                    .padding(left: 10),
              ],
            )
          ],
        ).padding(top: 20)
      ],
    )
        .padding(all: 20)
        .decorated(color: Colors.white)
        .padding(horizontal: 20, vertical: 5);
  }
}
