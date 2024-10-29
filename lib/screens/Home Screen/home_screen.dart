import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/exotic_cars.dart';
import 'package:car_rental_ui/screens/Home%20Screen/home_screen_content.dart';
import 'package:car_rental_ui/screens/profile.dart';
import 'package:car_rental_ui/screens/schedules_screen.dart';
import 'package:car_rental_ui/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedBrand = 'All';
  int currentPage = 0;
  final PageController _pageController = PageController();
  bool _showBottomBar = true;

  ExoticCarModel defaultCar = const ExoticCarModel(
      imagePath: 'assets/exotic/bugatti.png',
      brand: 'Koenigsegg',
      model: 'Agera one',
      engine: 'V12',
      maxspeed: '400',
      seats: '2',
      rate: '10,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      body: SafeArea(
        child: IndexedStack(
          children: [
            Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: [
                    HomeContent(
                      selectedBrand: selectedBrand,
                      onBrandSelected: (String brand) {
                        setState(() {
                          selectedBrand = brand;
                        });
                      },
                    ),
                    ExoticCars(
                      car: currentPage == 1 ? exoticCars[0] : defaultCar,
                    ),
                    const SchedulesScreen(),
                    const Profile(),
                  ],
                ),
                if (_showBottomBar)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavBar(
                      currentIndex: currentPage,
                      onTap: (int index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(microseconds: 800),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
