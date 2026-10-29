import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const DottedDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 4,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height + 2,
      child: CustomPaint(painter: _DottedLinePainter(height, dashWidth, color)),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final double height;
  final double dashWidth;
  final Color color;

  _DottedLinePainter(this.height, this.dashWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = height
          ..style = PaintingStyle.stroke;

    double startX = 0;
    final space = dashWidth;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
