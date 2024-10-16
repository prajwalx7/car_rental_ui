import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/widgets/car_container.dart';
import 'package:flutter/material.dart';

class CarContainerList extends StatefulWidget {
  final String selectedBrand; 

  const CarContainerList({super.key, required this.selectedBrand}); 

  @override
  State<CarContainerList> createState() => _CarContainerListState();
}

class _CarContainerListState extends State<CarContainerList> {
  @override
  Widget build(BuildContext context) {  
    List<CarModel> filteredCars = widget.selectedBrand == 'All'
        ? cars
        : cars.where((car) => car.brand == widget.selectedBrand).toList();

    return Expanded(
      child: ListView.builder(
          itemCount: filteredCars.length,
          itemBuilder: (context, index) {
            final car = filteredCars[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CarContainer(car: car),
            );
          }),
    );
  }
}
