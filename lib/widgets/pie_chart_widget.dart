import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final double inflow;
  final double outflow;

  const PieChartWidget({
    Key? key,
    required this.inflow,
    required this.outflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = inflow + outflow;
    final inflowPercent = total > 0 ? (inflow / total * 100) : 0;
    final outflowPercent = total > 0 ? (outflow / total * 100) : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Inflow',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Rs ${inflow.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 40),
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Outflow',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Rs ${outflow.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
const SizedBox(height: 20),
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              // Pie chart using CustomPaint
              CustomPaint(
                painter: PieChartPainter(inflow, outflow),
                size: const Size(200, 200),
              ),
              // Center text
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,                  
                ),
              ),
            ],
          ),
        ),
        
        ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final double inflow;
  final double outflow;

  PieChartPainter(this.inflow, this.outflow);

  @override
  void paint(Canvas canvas, Size size) {
    final total = inflow + outflow;
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    var startAngle = -3.14159265359 / 2;

    // Draw inflow (green)
    final inflowSweep = (inflow / total) * 2 * 3.14159265359;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      inflowSweep,
      true,
      Paint()..color = Colors.green,
    );

    // Draw outflow (red)
    startAngle += inflowSweep;
    const outflowSweep = double.infinity; // Will fill the rest
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      inflowSweep == 2 * 3.14159265359 ? 0 : (2 * 3.14159265359 - inflowSweep),
      true,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return oldDelegate.inflow != inflow || oldDelegate.outflow != outflow;
  }
}
