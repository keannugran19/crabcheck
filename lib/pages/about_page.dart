import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.background,
          title: const Text(
            "About us",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                """We are BSIT students from Davao del Norte State College and we are implementing CrabCheck: A Smart Edible Crab Identification and Evaluation Mobile Application using Image Processing to CAGRO Fisheries Section for our Capstone Project.

Our application uses a machine learning classification algorithm which determines the crab species and its edibility.

© Gran, Castilla, De Juan, Martos. BSIT 2024-2025.
                """,
                style: TextStyle(fontSize: 20, letterSpacing: 1.5, height: 2),
              ),
            )
          ],
        ),
      )),
    );
  }
}
