import 'package:car_rental_ui/screens/exotic_cars.dart';
import 'package:car_rental_ui/screens/home_screen_content.dart';
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
  final List<Widget> pages = [
    const HomeContent(),
    const ExoticCars(),
    const SchedulesScreen(),
    const Profile(),
  ];

  void _onNavBarTap(int index) {
    if (index != currentPage) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: pages,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavBar(
                currentIndex: currentPage,
                onTap: _onNavBarTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
