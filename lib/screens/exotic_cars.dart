import 'package:flutter/material.dart';
import 'package:car_rental_ui/model/exotic_car_mode.dart';

class ExoticCars extends StatefulWidget {
  const ExoticCars({super.key});

  @override
  State<ExoticCars> createState() => _ExoticCarsState();
}

class _ExoticCarsState extends State<ExoticCars> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
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
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff000000), Color(0xff000000)],
            stops: [0.5, 0.6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: PageView.builder(
            controller: _pageController,
            itemCount: exoticCars.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 206, 242, 97),
                            Color.fromARGB(255, 68, 66, 66),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Image.asset(
                        exoticCars[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 176,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(38)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${exoticCars[index].brand} ${exoticCars[index].model}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 20),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(58)),
                                child: Text("Take a look"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
