import 'dart:ui';

import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/spacing.dart';
import 'package:car_starter/components/const/text_field.dart';
import 'package:car_starter/components/textField/text_field.dart';
import 'package:car_starter/screens/main/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: greyColor6.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Хэрэглэгчийн мэдээлэл',
                          style: ktsBodyMediumBold.copyWith(color: whiteColor),
                        ),
                        h8(),
                        const CustomTextField(hintText: 'Нэр'),
                        h8(),
                        const CustomTextField(
                            hintText: 'Утасны дугаар',
                            keyboardType: TextInputType.phone),
                        h8(),
                        h8(),
                        Text(
                          'Машины мэдээлэл',
                          style: ktsBodyMediumBold.copyWith(color: whiteColor),
                        ),
                        h8(),
                        const CustomTextField(
                            hintText: 'Машин марк', isDropdown: true),
                        h8(),
                        const CustomTextField(
                            hintText: 'Машины загвар', isDropdown: true),
                        h8(),
                        const CustomTextField(hintText: 'Машин улсын дугаар'),
                        h8(),
                        h8(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: warningColor4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Хадгалах',
                            style:
                                ktsBodyMediumBold.copyWith(color: greyColor7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
