import 'package:car_rental_ui/model/car_model.dart';
import 'package:car_rental_ui/screens/home_screen.dart';
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
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff212024),
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(color: Colors.white70, width: 0.1),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  icon: const Icon(Iconsax.arrow_left),
                ),
              ),
              const Text("symbol"),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff212024),
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(color: Colors.white70, width: 0.1),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isStarred = !isStarred;
                    });
                  },
                  icon: Icon(Icons.star_rate_rounded,
                      size: 28,
                      color: isStarred == true ? Colors.amber : Colors.white),
                ),
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
            ar: true,
            arScale: ArScale.fixed,
            arPlacement: ArPlacement.floor,
            arModes: const ['scene-viewer'],
            loading: Loading.eager,
          ),
        ),
      ],
    );
  }
}
