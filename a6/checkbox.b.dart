import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'color.dart';

class CheckboxB extends StatefulWidget {
  CheckboxB(this.title, this.description, this.color, this.img);

  final String title;
  final String description;
  final Color color;
  final String img;

  @override
  _CheckboxAState createState() => new _CheckboxAState();
}

class _CheckboxAState extends State<CheckboxB> {
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    var a = Container(
        child: CheckboxListTile(
      value: _checkboxSelected,
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      subtitle: widget.description != null
          ? Text(
              widget.description,
              style: TextStyle(
                  fontSize: 12,
                  color: _checkboxSelected
                      ? widget.color.withAlpha(200)
                      : Colors.black54),
            )
          : null,
      activeColor: widget.color,
      dense: true,
      selected: true,
      isThreeLine: false,
      secondary: Image.asset(
        widget.img,
        fit: BoxFit.fill,
      ).clipRRect(all: 65).padding(vertical: 4),
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (value) {
        print(value);
        setState(() {
          _checkboxSelected = value;
        });
      },
    ).padding(vertical: 5));
    return a
            .backgroundColor(
                _checkboxSelected
                    ? ColorLighter(widget.color, 60).withAlpha(50)
                    : Colors.transparent,
                animate: true)
            .animate(Duration(milliseconds: 150 * 3), Curves.easeOut)
        // .padding(vertical: 2, horizontal: 8)
        ;
  }
}
