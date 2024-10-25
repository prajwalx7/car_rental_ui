import 'package:car_rental_ui/screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/start_image2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffCFFA49),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5, // Shadow
            ),
            child: const Text(
              "Find Your Drive",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Your perfect drive is just a tap away!",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
