import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                radius: 25,
              ),
              SizedBox(width: 80),
              Icon(Iconsax.location, size: 12),
              SizedBox(width: 3),
              Text(
                "CSN, India",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: 'Prompt', fontSize: 12, color: Colors.white),
              ),
              Spacer(),
              Icon(Icons.sort)
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              Text(
                "Hello, ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: 'Prompt', fontSize: 32, color: Colors.white70),
              ),
              Text(
                "Prajwal",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: 'Prompt', fontSize: 32, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            "Choose your ideal car",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: 'Prompt', fontSize: 18, color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
