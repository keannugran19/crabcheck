import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  const TagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
        buttonText: "Tag to Map",
        buttonColor: colorScheme.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });
  }
}
