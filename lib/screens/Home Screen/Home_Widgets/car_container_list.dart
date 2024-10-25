import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/Home%20Screen/Home_Widgets/car_container.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

class CarContainerList extends StatefulWidget {
  final String selectedBrand;

  const CarContainerList({super.key, required this.selectedBrand});

  @override
  State<CarContainerList> createState() => _CarContainerListState();
}

class _CarContainerListState extends State<CarContainerList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CarModel> filteredCars = widget.selectedBrand == 'All'
        ? cars
        : cars
            .where((car) =>
                car.brand.trim().toLowerCase() ==
                widget.selectedBrand.trim().toLowerCase())
            .toList();

    return Expanded(
      child: FadingEdgeScrollView.fromScrollView(
        gradientFractionOnStart: 0.1,
        gradientFractionOnEnd: 0.5,
        child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: filteredCars.length,
          itemBuilder: (context, index) {
            final car = filteredCars[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: CarContainer(car: car),
            );
          },
        ),
      ),
    );
  }
}
