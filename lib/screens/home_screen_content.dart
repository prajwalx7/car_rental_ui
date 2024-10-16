import 'package:car_rental_ui/widgets/car_container_list.dart';
import 'package:car_rental_ui/widgets/header_widget.dart';
import 'package:car_rental_ui/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
        const SizedBox(height: 8),
        HorizontalList(
          onBrandSelected: (brand) {
            (context as Element).markNeedsBuild();
          },
        ),
        const SizedBox(height: 20),
        const CarContainerList(selectedBrand: 'All'),
      ],
    );
  }
}
