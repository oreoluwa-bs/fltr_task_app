import 'package:flutter/material.dart';
import 'package:task_app/src/globals/globals.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final EdgeInsetsGeometry padding;

  const SectionHeading({
    Key key,
    @required this.title,
    this.actions: const [],
    this.padding: const EdgeInsets.only(top: 30.0, left: 35),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Text(title, style: kHeadingText),
                Spacer(),
                ...actions,
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
