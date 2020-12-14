import 'package:flutter/material.dart';

class DarkModeIconButton extends StatelessWidget {
  const DarkModeIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.brightness_high),
      iconSize: 30.0,
      color: Colors.white,
      onPressed: () {},
    );
  }
}

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
      iconSize: 30.0,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
