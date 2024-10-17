import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                radius: 25,
              ),
              SizedBox(width: 80),
              Icon(Iconsax.location, size: 12),
              SizedBox(width: 3),
              Text("CSN, India"),
              Spacer(),
              Icon(Icons.sort)
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text("Hello, ",
                  style: TextStyle(color: Colors.white38, fontSize: 38)),
              Text(
                "Prajwal",
                style: TextStyle(fontSize: 38),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Choose your ideal car",
            style: TextStyle(color: Colors.white54, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
