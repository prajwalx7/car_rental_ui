import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HorizontalList extends StatefulWidget {
  final Function(String) onBrandSelected;

  const HorizontalList({super.key, required this.onBrandSelected});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<String> carBrands = [
    'All',
    'BMW',
    'Lamborghini',
    'Audi',
    'Ferrari',
    'Honda',
    'Porsche',
    'Ford',
    'Mercedes',
    'Chevrolet'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: carBrands.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: buildCarsWidget(carBrands[index], index),
        ),
      ),
    );
  }

  Widget buildCarsWidget(String brand, int index) {
    return FilterChip(
      padding: EdgeInsets.symmetric(horizontal: 12),
      backgroundColor: const Color(0xff212024),
      label: Text(
        brand,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Prompt',
            fontSize: 14,
            color: selectedIndex == index ? Colors.black : Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
      side: BorderSide.none,
      disabledColor: Colors.white,
      selectedColor: const Color(0xffCFFA49),
      showCheckmark: false,
      selected: selectedIndex == index,
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = index;
          widget.onBrandSelected(brand);
        });
      },
    ).animate().shimmer(duration: 1000.ms);
  }
}
