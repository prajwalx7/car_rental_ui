import 'package:car_rental_ui/widgets/car_container_list.dart';
import 'package:car_rental_ui/widgets/header_widget.dart';
import 'package:car_rental_ui/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final String selectedBrand;
  final ValueChanged<String> onBrandSelected;

  const HomeContent({
    super.key,
    required this.selectedBrand,
    required this.onBrandSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
        const SizedBox(height: 10),
        HorizontalList(
          onBrandSelected: onBrandSelected,
        ),
        const SizedBox(height: 8),
        CarContainerList(selectedBrand: selectedBrand),
      ],
    );
  }
}
