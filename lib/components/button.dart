import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color? buttonColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        buttonText,
        style: TextStyle(
          fontSize: 15,
          color: colorScheme.background,
        ),
      ),
      icon: const Icon(
        Icons.add_location_alt_outlined,
        color: Colors.white,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(174, 50), // Set the desired width and height
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Set your desired border radius
          ),
        ),
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // Return the color when the button is pressed
            return buttonColor?.withOpacity(0.5) ??
                colorScheme.secondary.withOpacity(0.5);
          }
          // Return the default color for the button
          return buttonColor ?? colorScheme.secondary;
        }),
      ),
    );
  }
}
