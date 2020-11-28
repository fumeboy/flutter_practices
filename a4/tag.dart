import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

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
