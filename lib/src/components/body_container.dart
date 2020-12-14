import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final child;

  const BodyContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      child: Container(
        padding: EdgeInsets.only(top: 12.0),
        color: Colors.white,
        child: child,
      ),
    );
  }
}
