import 'package:car_rental_ui/screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isFinished = false;
  bool isSwipeStarted = false;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SwipeableButtonView(
              buttonText: 'Find you drive!',
              buttontextstyle: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 16,
                  wordSpacing: 2,
                  letterSpacing: 1),
              buttonWidget: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xffCFFA49),
                    borderRadius: BorderRadius.circular(32)),
                child: Image.asset('assets/images/car_icon.png'),
              ),
              activeColor: Color(0xff212024),
              indicatorColor: AlwaysStoppedAnimation(Color(0xffCFFA49)),
              isFinished: isFinished,
              onWaitingProcess: () {
                setState(() {
                  isSwipeStarted = true;
                });
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    isFinished = true;
                  });
                });
              },
              onFinish: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));

                setState(() {
                  isFinished = false;
                  isSwipeStarted = false;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          if (!isSwipeStarted)
            const Text(
              "Your drive awaits—just a swipe away!",
              style: TextStyle(
                  fontSize: 16, color: Colors.white70, fontFamily: 'Prompt'),
            )
                .animate()
                .slideY(duration: 500.ms, delay: 200.ms, begin: 3, end: 0)
          else
            const Text(
              "Your drive awaits—just a swipe away!",
              style: TextStyle(
                  fontSize: 16, color: Colors.white70, fontFamily: 'Prompt'),
            )
                .animate()
                .slideY(duration: 500.ms, delay: 100.ms, begin: 0, end: 3),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
