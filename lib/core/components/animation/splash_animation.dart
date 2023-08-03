import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const SplashAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {

    final tween = MovieTween();

    tween.tween('opacity', Tween(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 500));

    tween.tween('height', Tween(begin: (context.height * 0.1).toDouble(), end: 80.0),
        duration: const Duration(milliseconds: 500));

    tween.tween('translateY', Tween(begin: 0.0, end: (context.highValue*1.6).toDouble()),
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (BuildContext context, value, Widget? child) {
        return Transform.translate(
            offset: Offset(0, -value.get('translateY')),
            child: Container(
              height: value.get('height'),
                child: child)
        );
      },
    );
  }
}