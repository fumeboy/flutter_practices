import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CheckboxA extends StatefulWidget {
  CheckboxA(this.title, this.description, this.color);

  final String title;
  final String description;
  final Color color;

  @override
  _CheckboxAState createState() => new _CheckboxAState();
}

class _CheckboxAState extends State<CheckboxA> {
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
              style:
                  TextStyle(fontSize: 12, color: widget.color.withAlpha(200)),
            )
          : null,
      activeColor: widget.color,
      dense: true,
      selected: true,
      isThreeLine: false,
      // secondary: Icon(Icons.book),
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (value) {
        print(value);
        setState(() {
          _checkboxSelected = value;
        });
      },
    ));
    return a
        .backgroundColor(
            _checkboxSelected
                ? widget.color
                    .withRed(widget.color.red + 80)
                    .withBlue(widget.color.blue + 80)
                    .withGreen(widget.color.green + 80)
                    .withAlpha(50)
                : Colors.transparent,
            animate: true)
        .animate(Duration(milliseconds: 150 * 3), Curves.easeOut);
  }
}
