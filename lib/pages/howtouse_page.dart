import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';

class HowPage extends StatelessWidget {
  const HowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.background,
          title: const Text(
            "How to use our app?",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                """Step 1. If you found a crab, take a picture of the crab using the capture button. However, if you already have your own picture in your gallery, upload the photo using the upload button.

Step 2. Wait for the image to process.

Step 3. The result will pop up and will classify the crab species and it's edibility.

    Step 3.1 We ask for your permission to use your location by clicking the 'Tag to Map' button to send the data to our CAGRO Fisheries section for mapping.
                """,
                style: TextStyle(fontSize: 20, height: 2),
              ),
            )
          ],
        ),
      )),
    );
  }
}
