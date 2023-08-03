import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.grey[200];
    final highlightColor = theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100];

    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor!,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
