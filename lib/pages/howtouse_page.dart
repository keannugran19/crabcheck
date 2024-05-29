import 'package:flutter/material.dart';

class HowPage extends StatelessWidget {
  const HowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                "How to use our app?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                """1. If you found a crab, take a picture of the crab using the capture button. However, if you already have your own picture in your gallery, upload the photo using the upload button.
                
2. Wait for the image to process.

3. The result will pop up and will classify the crab species and it's edibility.

    3.1 If the crab identified is inedible, we ask for  your permission to use your location to send the data to our CAGRO Fisheries section for mapping.
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
