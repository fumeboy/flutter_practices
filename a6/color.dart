import 'package:flutter/material.dart';

Color ColorLighter(Color c, int n) {
  var red = c.red + n > 255 ? 255 : c.red + n;
  var blue = c.blue + n > 255 ? 255 : c.blue + n;
  var green = c.green + n > 255 ? 255 : c.green + n;
  return c.withRed(red).withBlue(blue).withGreen(green);
}
