import 'package:car_starter/components/button/button.dart';
import 'package:car_starter/screens/start/register_screen.dart';

import 'package:flutter/material.dart';

class DeviceAddScreen extends StatefulWidget {
  const DeviceAddScreen({super.key});

  @override
  State<DeviceAddScreen> createState() => _DeviceAddScreenState();
}

class _DeviceAddScreenState extends State<DeviceAddScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/add_device_bg.png', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          // Logo and text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddDeviceButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
