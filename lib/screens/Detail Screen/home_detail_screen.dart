import 'package:car_rental_ui/screens/Detail%20Screen/Details%20Widget/header.dart';
import 'package:car_rental_ui/screens/Detail%20Screen/Details%20Widget/middle.dart';
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
  bool isStarred = false;
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
                  buildSpecifications('assets/svg/speed.svg', "Max Speed",
                      widget.car.speed, context),
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
                  buildSpecifications('assets/svg/engine.svg', "Engine",
                      widget.car.engine, context),
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
                  buildSpecifications('assets/svg/seats.svg', "Seats",
                      widget.car.seats, context),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    color: Colors.white),
                          ),
                          Spacer(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '₹ ${widget.car.rate}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontFamily: 'Prompt',
                                          fontSize: 26,
                                          color: Colors.white),
                                ),
                                TextSpan(
                                  text: " /1 Day",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontFamily: 'Prompt',
                                          fontSize: 14,
                                          color: Colors.white60),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(42)),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isStarred = !isStarred;
                                });
                              },
                              icon: Icon(Icons.favorite,
                                  size: 28,
                                  color: isStarred == true
                                      ? Colors.redAccent
                                      : Colors.white),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 12),
                            decoration: BoxDecoration(
                                color: const Color(0xffCFFA49),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Pick a date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontFamily: 'Prompt',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
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

Widget buildSpecifications(
    String svgPath, String text, String speed, BuildContext context) {
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
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Prompt', fontSize: 16, color: Colors.white70),
      ),
      const SizedBox(height: 8),
      Text(
        speed,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Orbitron', fontSize: 14, color: Colors.white),
      ),
    ],
  );
}
