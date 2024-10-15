import 'dart:io';

import 'package:crabcheck/components/tag_button.dart';
import 'package:crabcheck/data/data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MetopograpsusSpp extends StatelessWidget {
  final double confidence;
  final String label;
  final XFile filePath;
  const MetopograpsusSpp({
    super.key,
    required this.confidence,
    required this.label,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Image Container
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.9,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.file(
                File(filePath.path),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Dynamic scaling text
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "The Accuracy is ${confidence.toStringAsFixed(0)}%",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    metopograpsusSpp.edibility,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "Species: $label",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Local name: ${metopograpsusSpp.localName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
                    child: Text(
                      metopograpsusSpp.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Button Back to Home
          TagButton(
            label: label,
            filePath: filePath,
          ),

          const SizedBox(
            width: 174,
            child: Text(
              textAlign: TextAlign.center,
              "Allow us to use your location to improve CAGRO's data.",
              style: TextStyle(fontSize: 10),
            ),
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
