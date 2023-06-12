import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:skeleton_builder/src/effects/painting_effect_base.dart';

class PulseEffect extends PaintingEffect {
  final Color from;
  final Color to;

  PulseEffect({
    this.from = const Color(0xFFEBEBF4),
    this.to = const Color(0xFFF4F4F4),
    super.lowerBound,
    super.upperBound,
  }) : super(reverse: true);

  @override
  Paint createPaint(double t, Rect rect) {
    final color = Color.lerp(from, to, t)!;
    // find a better way to create one-color shaders!
    return Paint()
      ..shader = LinearGradient(
        colors: [color, color],
      ).createShader(rect);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PulseEffect && runtimeType == other.runtimeType && from == other.from && to == other.to;

  @override
  int get hashCode => from.hashCode ^ to.hashCode;
}
