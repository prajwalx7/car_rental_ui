import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/home_detail_screen.dart';
import 'package:flutter/material.dart';

class CarContainer extends StatelessWidget {
  final CarModel car;

  const CarContainer({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff212024),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          car.rating,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      car.brand,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Color(0xffCFFA49),
                      ),
                    ),
                    Text(
                      car.model,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 30),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: '₹ ${car.rate}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const TextSpan(
                            text: "  1 day rental",
                            style: TextStyle(color: Colors.white70))
                      ]),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Image.asset(
                      car.modelUrl,
                      height: 160,
                      width: 180,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailScreen(car: car)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42)),
              backgroundColor: const Color(0xffCFFA49),
              mini: true,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
