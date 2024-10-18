import 'package:car_rental_ui/Widgets2/header.dart';
import 'package:car_rental_ui/Widgets2/middle.dart';
import 'package:car_rental_ui/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDetailScreen extends StatefulWidget {
  final CarModel car;

  const HomeDetailScreen({super.key, required this.car});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Header(car: widget.car),
              const SizedBox(height: 10),
              Middle(car: widget.car),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSpecifications(
                      'assets/svg/speed.svg', "Max Speed", "450 Km/h"),
                  Container(
                    height: 80,
                    width: 1,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white,
                            Colors.transparent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                  buildSpecifications(
                      'assets/svg/engine.svg', "Engine", "V8 Turbo"),
                  Container(
                    height: 80,
                    width: 1,
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white,
                              Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  buildSpecifications('assets/svg/seats.svg', "Seats", "2"),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xff212024),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rent Price',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: '₹ ${widget.car.rate}',
                                    style: TextStyle(fontSize: 26)),
                                TextSpan(
                                    text: " /1 Day",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(42)),
                              child: const Icon(Icons.calendar_month)),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 12),
                            decoration: BoxDecoration(
                                color: const Color(0xffCFFA49),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              "Book now",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSpecifications(String svgPath, String text, String speed) {
  return Column(
    children: [
      SvgPicture.asset(
        svgPath,
        height: 20,
        width: 20,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      const SizedBox(height: 5),
      Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      const SizedBox(height: 8),
      Text(
        speed,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    ],
  );
}
