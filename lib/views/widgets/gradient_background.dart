import 'dart:ui';
import 'package:flutter/material.dart';

final class GradientBackground extends StatelessWidget {
  final double width;
  final double height;
  final List<Color> colors;
  final double opacity;
  final Widget? child;
  final GradientType gradientType; //circular, linear, sweep
  final Gradient? gradient;
  final double blur;

  const GradientBackground({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.colors,
    this.opacity = 1.0,
    this.child,
    this.gradientType = GradientType.linear,
    this.gradient,
    this.blur = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ?? _createGradient(colors, opacity, gradientType),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }

  Gradient _createGradient(
    List<Color> colors,
    double opacity,
    GradientType gradientType,
  ) {
    switch (gradientType) {
      case GradientType.radial:
        return RadialGradient(colors: colors.map((color) => color.withOpacity(opacity)).toList());
      case GradientType.sweep:
        return SweepGradient(colors: colors.map((color) => color.withOpacity(opacity)).toList());

      default:
        return LinearGradient(
          colors: colors.map((color) => color.withOpacity(opacity)).toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}

enum GradientType { linear, radial, sweep }