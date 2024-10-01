import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          "About Us",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We are BSIT students from Davao del Norte State College and we are implementing CrabCheck: A Smart Edible Crab Identification and Evaluation Mobile Application using Image Processing to CAGRO Fisheries Section for our Capstone Project.",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Our application uses a machine learning classification algorithm which determines the crab species and its edibility.",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "© Gran, Castilla, De Juan, Martos. BSIT 2024-2025.",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle:
                      FontStyle.italic, // Italic for a subtle copyright text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
