import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/text_field.dart';

import 'package:car_starter/screens/start/add_device_scree.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation to deviceAddScreen by 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => DeviceAddScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/splash_bg.png', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          // Logo and text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png', // Replace with your logo image path
                height: 60, // Adjust height as needed
              ),
              SizedBox(height: 16),
              // App name
              Text(
                'Starter car',
                style: ktsBodyLargeBold.copyWith(color: whiteColor),
              ),
              // Subtitle
              Text(
                'Алсаас машин асаагч',
                style: ktsBodyMedium.copyWith(color: whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
