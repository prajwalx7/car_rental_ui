import 'package:car_rental_ui/widgets/car_container_list.dart';
import 'package:car_rental_ui/widgets/header_widget.dart';
import 'package:car_rental_ui/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedBrand = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 8),
            HorizontalList(
              onBrandSelected: (brand) {
                setState(() {
                  selectedBrand = brand;
                });
              },
            ),
            const SizedBox(height: 20),
            CarContainerList(selectedBrand: selectedBrand),
          ],
        ),
      ),
    );
  }
}
