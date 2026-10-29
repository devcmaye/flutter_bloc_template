import 'package:flutter/material.dart';

class EnvironmentWatermark extends StatelessWidget {
  final String label;
  final Color color;
  final double opacity;

  const EnvironmentWatermark({
    super.key,
    required this.label,
    this.color = Colors.red,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: _WatermarkPainter(
            text: label,
            color: color,
            opacity: opacity,
          ),
        ),
      ),
    );
  }
}

class _WatermarkPainter extends CustomPainter {
  final String text;
  final Color color;
  final double opacity;

  _WatermarkPainter({
    required this.text,
    required this.color,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = TextPainter(textDirection: TextDirection.ltr);

    final textStyle = TextStyle(
      color: color.withOpacity(opacity),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    const double stepX = 180;
    const double stepY = 120;

    canvas.save();
    canvas.rotate(-0.5); // diagonal effect

    for (double i = -size.height; i < size.width + size.height; i += stepX) {
      for (double j = -size.width; j < size.height + size.width; j += stepY) {
        paint.text = TextSpan(text: text, style: textStyle);
        paint.layout();

        paint.paint(canvas, Offset(i, j));
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// import 'dart:math' as math;
// import 'package:flutter/material.dart';

// class EnvironmentWatermark extends StatelessWidget {
//   final String label;
//   final Color color;

//   const EnvironmentWatermark({
//     super.key,
//     required this.label,
//     this.color = Colors.red,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 0, left: 0),
//           child: Transform.rotate(
//             angle: 30 * math.pi / 180,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.12),
//                 border: Border.all(color: color),
//                 borderRadius: BorderRadius.circular(6),
//               ),

//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   label,
//                   style: TextStyle(
//                     color: color,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     height: 1.0,
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
