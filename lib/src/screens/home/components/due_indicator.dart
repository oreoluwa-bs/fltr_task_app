import 'package:flutter/material.dart';
import 'package:task_app/src/globals/globals.dart';

class DueIndicator extends StatelessWidget {
  final Color priorityColor;
  final DateTime dueDate;

  const DueIndicator({
    Key key,
    @required this.priorityColor,
    @required this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: priorityColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.alarm,
            size: 15.0,
            color: Colors.white,
          ),
          SizedBox(width: 5.0),
          Text(
            dueValue(dueDate),
            style: kBodySubText.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
