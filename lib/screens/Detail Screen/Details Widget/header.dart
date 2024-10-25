import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Header extends StatefulWidget {
  final CarModel car;
  const Header({super.key, required this.car});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                icon: const Icon(Iconsax.arrow_left),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 270,
          child: ModelViewer(
            src: widget.car.model3dUrl,
            fieldOfView: "30deg",
            cameraOrbit: "45deg 75deg 105%",
          ),
        ),
      ],
    );
  }
}
