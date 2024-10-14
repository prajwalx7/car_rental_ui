import 'package:car_rental_ui/widgets/header_widget.dart';
import 'package:car_rental_ui/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            const HorizontalList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff212024),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("4.6"),
                        Text("Ferrari"),
                        Text("488 Spider"),
                        Text("5000 Rs 1 day rental"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 180,
                          width: 200,
                          child: ModelViewer(
                            cameraControls: false,
                            disablePan: true,
                            disableTap: true,
                            disableZoom: true,
                            src: 'assets/3Dmodels/ferrari.glb',
                            autoPlay: false,
                            autoRotate: false,
                            cameraOrbit: '90deg 30deg 3m',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
