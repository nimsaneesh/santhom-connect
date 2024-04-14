import 'package:flutter/widgets.dart';
class CurvedDecoration extends BoxDecoration {
  CurvedDecoration({Color? color})
      : super(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100), // Adjust the radius as needed
            bottomLeft: Radius.circular(100), // Adjust the radius as needed
          ),
        );
}