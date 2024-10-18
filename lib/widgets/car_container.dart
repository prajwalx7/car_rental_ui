import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/home_detail_screen.dart';
import 'package:flutter/material.dart';

class CarContainer extends StatelessWidget {
  final CarModel car;

  const CarContainer({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff212024),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brand,
                    style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xffCFFA49)),
                  ),
                  Text(
                    car.model,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Image.asset(
                car.modelUrl,
                height: 140,
                width: 180,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailScreen(car: car)));
                },
                child: CustomPaint(
                  painter: RoundedCornerTrianglePainter(),
                  child: SizedBox(
                    height: 50,
                    width: 70,
                    child: Center(
                      child: Transform.translate(
                        offset: const Offset(15, 8),
                        child: Transform.rotate(
                          angle: 0.2,
                          child: Image.asset(
                            "assets/images/arrow.png",
                            height: 25,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedCornerTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffCFFA49)
      ..style = PaintingStyle.fill;

    const radius = 12.0;
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..arcToPoint(
        Offset(size.width, size.height - radius),
        radius: const Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
