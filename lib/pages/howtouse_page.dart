import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';

class HowPage extends StatelessWidget {
  const HowPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 20,
      height: 1.5, // Improved line height for readability
    );
    var space = const SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          "How to use our app?",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              Text(
                "Step 1. If you found a crab, take a picture using the capture button. Alternatively, if you already have a picture in your gallery, upload the photo using the upload button.",
                style: textStyle,
              ),
              space,
              Text(
                "Step 2. Wait for the image to process.",
                style: textStyle,
              ),
              space,
              Text(
                "Step 3. The result will pop up, classifying the crab species and its edibility.",
                style: textStyle,
              ),
              space,
              Text(
                "Step 3.1. You will be asked for permission to use your location. By clicking the 'Tag to Map' button, the data will be sent to the CAGRO Fisheries section for mapping.",
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
