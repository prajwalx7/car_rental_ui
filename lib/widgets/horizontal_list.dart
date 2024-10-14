import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<String> carBrands = [
    'All',
    'BMW',
    'Audi',
    'Ferrari',
    'Bugatti',
    'Tesla',
    'Honda',
    'McLaren',
    'Porsche',
    'Koenigsegg',
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
          padding: const EdgeInsets.all(6.0),
          child: buildCarsWidget(carBrands[index], index),
        ),
      ),
    );
  }

  Widget buildCarsWidget(String brand, int index) {
    return FilterChip(
      backgroundColor: const Color(0xff212024),
      label: Text(
        brand,
        style: TextStyle(
            color: selectedIndex == index ? Colors.black : Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42)),
      side: BorderSide.none,
      disabledColor: Colors.white,
      selectedColor: const Color(0xffCFFA49),
      showCheckmark: false,
      selected: selectedIndex == index,
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
