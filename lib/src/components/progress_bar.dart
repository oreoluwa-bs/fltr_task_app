import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color progressBarColor;
  final height;
  final borderRadius;

  const ProgressBar({
    Key key,
    @required this.progress,
    this.progressBarColor: const Color(0xFFFFFFFF),
    this.height: 10.0,
    this.borderRadius: 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        final progressWidth = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              height: height,
              width: progressWidth * progress,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: progressBarColor,
              ),
            ),
            Container(
              height: height,
              width: progressWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: progressBarColor.withOpacity(0.50),
              ),
            ),
          ],
        );
      },
    );
  }
}
