import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;
  final Gradient gradient;
  final Color backgroundColor;

  const GradientProgressIndicator({
    Key? key,
    required this.value,
    required this.gradient,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: CustomPaint(
        painter: _GradientProgressPainter(
          value: value,
          gradient: gradient,
        ),
      ),
    );
  }
}

class _GradientProgressPainter extends CustomPainter {
  final double value;
  final Gradient gradient;

  _GradientProgressPainter({
    required this.value,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient
          .createShader(Rect.fromLTWH(0, 0, size.width * value, size.height))
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width * value, size.height),
        const Radius.circular(5.0),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
