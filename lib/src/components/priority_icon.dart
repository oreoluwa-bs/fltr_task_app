import 'package:flutter/material.dart';

class PriorityIcon extends StatelessWidget {
  final double iconSize;
  final double iconRadius;
  final double iconGap;
  final Color priorityColor;

  const PriorityIcon({
    Key key,
    @required this.priorityColor,
    this.iconSize: 10.0,
    this.iconRadius: 20.0,
    this.iconGap: 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(iconRadius),
              color: priorityColor),
        ),
        SizedBox(width: iconGap),
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconRadius),
            color: priorityColor,
          ),
        ),
        SizedBox(width: iconGap),
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconRadius),
            color: priorityColor,
          ),
        ),
      ],
    );
  }
}
