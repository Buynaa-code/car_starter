import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/text_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isDropdown;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isDropdown = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      cursorColor: warningColor4, // Set the cursor color here
      decoration: InputDecoration(
        filled: true,
        fillColor: greyColor2,
        hintText: hintText,
        suffixIcon: isDropdown
            ? const Icon(Icons.arrow_drop_down, color: Colors.white)
            : null,
        hintStyle: ktsBodyMedium.copyWith(color: greyColor5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: ktsBodyMedium.copyWith(color: whiteColor),
    );
  }
}
