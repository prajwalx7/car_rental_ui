import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xff212024),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Iconsax.home, 0),
          _buildNavItem(context, Iconsax.car, 1),
          _buildNavItem(context, Iconsax.calendar, 2),
          _buildNavItem(context, Iconsax.user, 3),
        ],
      ),
    ).animate().slideY(
        duration: 800.ms,
        // delay: 100.ms,
        begin: 3,
        end: 0,
        curve: Curves.easeIn);
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    int index,
  ) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0xffCFFA49) : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.black : Colors.white,
        ).animate().scale(duration: 600.ms, delay: 600.ms),
      ),
    );
  }
}
