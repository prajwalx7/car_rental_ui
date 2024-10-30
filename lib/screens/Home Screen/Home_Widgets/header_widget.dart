import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
              ).animate().slideX(
                    duration: 800.ms,
                    begin: -3,
                    end: 0.03,
                  ),
              SizedBox(width: 80),
              locationWidget("CSN, India", context),
              Spacer(),
              Icon(Icons.sort)
                  .animate()
                  .slideX(duration: 800.ms, begin: 3, end: -0.01)
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
              ).animate().fadeIn(duration: 1200.ms),
              Text(
                "Prajwal",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: 'Prompt', fontSize: 32, color: Colors.white),
              ).animate().fadeIn(duration: 1200.ms),
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
          ).animate().fadeIn(duration: 1200.ms),
        ),
      ],
    );
  }
}

Widget locationWidget(String location, BuildContext context) {
  return Row(
    children: [
      Icon(Iconsax.location, size: 12).animate().scale(duration: 800.ms),
      SizedBox(width: 3),
      Text(
        location,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontFamily: 'Prompt', fontSize: 12, color: Colors.white),
      ),
    ],
  ).animate().scale(duration: 800.ms);
}
