import 'package:blur/blur.dart';
import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExoticCars extends StatefulWidget {
  final ExoticCarModel car;
  const ExoticCars({super.key, required this.car});

  @override
  State<ExoticCars> createState() => _ExoticCarsState();
}

class _ExoticCarsState extends State<ExoticCars> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      appBar: AppBar(
        title: const Text("Exotic Cars"),
        centerTitle: true,
        backgroundColor: const Color(0xff06090D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: PageView.builder(
          controller: _pageController,
          itemCount: exoticCars.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38)),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              exoticCars[index].imagePath,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ).frosted(
                                blur: 15,
                                frostColor: Color.fromARGB(255, 228, 222, 222),
                                frostOpacity: 0.2),
                          ),
                        ),
                        Text(
                          exoticCars[index].brand,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontFamily: 'Orbitron',
                                  fontSize: 22,
                                  color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          exoticCars[index].model,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  color: Colors.black87),
                        ),
                        SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildSpecifications('assets/svg/speed.svg',
                                "Max Speed", widget.car.maxspeed, context),
                            Container(
                              height: 80,
                              width: 1,
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                            buildSpecifications('assets/svg/engine.svg',
                                "Engine", widget.car.engine, context),
                            Container(
                              height: 80,
                              width: 1,
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
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
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16),
                            decoration: BoxDecoration(
                                color: const Color(0xFF383838),
                                borderRadius: BorderRadius.circular(24)),
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
                                                    fontSize: 18,
                                                    color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: " /1 Day",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontFamily: 'Prompt',
                                                    fontSize: 10,
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
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(42)),
                                        child: const Icon(
                                          Icons.calendar_month,
                                          color: Color(0xffCFFA49),
                                        )),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 12),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffCFFA49),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Book now",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontFamily: 'Prompt',
                                                fontSize: 22,
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
                  ],
                ),
              ),
            );
          },
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
        height: 25,
        width: 25,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Prompt', fontSize: 16, color: Colors.black87),
      ),
      const SizedBox(height: 8),
      Text(
        speed,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Orbitron', fontSize: 14, color: Colors.black),
      ),
    ],
  );
}
