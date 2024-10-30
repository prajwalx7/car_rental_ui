import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/Detail%20Screen/home_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          gradient: LinearGradient(
            colors: [Colors.grey[900]!, Colors.grey[850]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brand,
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xffCFFA49),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    car.model,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/speed.svg',
                        height: 15,
                        width: 15,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      SizedBox(width: 3),
                      Text(
                        car.speed,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontFamily: 'Prompt',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400,
                            ),
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/svg/seats.svg',
                        height: 15,
                        width: 15,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '${car.seats} seats',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontFamily: 'Prompt',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '₹ ${car.rate}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
                        TextSpan(
                          text: '/day',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontFamily: 'Prompt',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400,
                                  ),
                        )
                      ],
                    ),
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
              ).animate().moveX(duration: 800.ms, begin: 20, end: -3),
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
