import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Center(
                  child: Text(
                "About Us",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                """We are BSIT students from Davao del Norte State College and we are implementing CrabCheck: A Smart Edible Crab Identification and Evaluation Mobile Application using Image Processing to CAGRO Fisheries Section for our Capstone Project.
                """,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
