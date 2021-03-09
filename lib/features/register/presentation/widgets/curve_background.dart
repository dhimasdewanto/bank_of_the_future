import 'package:flutter/material.dart';

class CurveBackground extends StatelessWidget {
  const CurveBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: CurvePainter(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height / 3);
    path.quadraticBezierTo(
      size.width / 20,
      size.height / 8,
      size.width,
      size.height / 3,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
