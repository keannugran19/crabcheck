import 'package:crabcheck/components/tag_button.dart';
import 'package:crabcheck/data/data.dart';
import 'package:flutter/material.dart';

class ScyllaSerrata extends StatelessWidget {
  final double confidence;
  final String label;
  const ScyllaSerrata({
    super.key,
    required this.confidence,
    required this.label,
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
              child: Image.asset(
                scyllaSerrata.image,
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
                    scyllaSerrata.edibility,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green,
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
                    "Local name: ${scyllaSerrata.localName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
                    child: Text(
                      scyllaSerrata.description,
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
          TagButton(label: label),

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