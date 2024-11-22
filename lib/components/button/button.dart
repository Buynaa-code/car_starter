import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/text_field.dart';
import 'package:flutter/material.dart';

class AddDeviceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddDeviceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: warningColor4, // Background color (light yellow)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.qr_code_scanner, // Replace with your desired icon
            color: greyColor7, // Icon color
          ),
          SizedBox(width: 8),
          Text(
            'Төхөөрөмж нэмэх',
            style: ktsBodyMediumBold.copyWith(color: greyColor7),
          ),
        ],
      ),
    );
  }
}
