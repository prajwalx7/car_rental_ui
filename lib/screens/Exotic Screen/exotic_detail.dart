import 'package:flutter/material.dart';

class ExoticDetail extends StatelessWidget {
  const ExoticDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: const Center(
        child: Text("Detail Screen Content"),
      ),
    );
  }
}