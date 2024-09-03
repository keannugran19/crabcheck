import 'dart:io';

import 'package:crabcheck/components/tag_button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class CharybdisFeriatus extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const CharybdisFeriatus({
    super.key,
    this.filePath,
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
              child: filePath == null
                  ? const SizedBox.shrink()
                  : Image.file(
                      filePath!,
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
                    charybdisFeriatus.edibility,
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
                    "Local name: ${charybdisFeriatus.localName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
                    child: Text(
                      charybdisFeriatus.description,
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

class CharybdisNatotor extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const CharybdisNatotor(
      {super.key,
      this.filePath,
      required this.confidence,
      required this.label});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Container
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: filePath == null
                      ? const Text('')
                      : Image.file(
                          filePath!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              "The Accuracy is ${confidence.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            Text(charybdisNatotor.edibility,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green,
                )),

            const SizedBox(
              height: 5,
            ),

            Text("Species: $label",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Text("Local name: ${charybdisNatotor.localName}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
              child: Text(charybdisNatotor.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Button Back to Home
            TagButton(label: label),

            // Text permission to use user's location
            const SizedBox(
              height: 50,
              width: 174,
              child: Text(
                textAlign: TextAlign.center,
                "Allow us to use your location to improve CAGRO's data.",
                style: TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ZosimusAeneus extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const ZosimusAeneus(
      {super.key,
      this.filePath,
      required this.confidence,
      required this.label});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Container
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: filePath == null
                      ? const Text('')
                      : Image.file(
                          filePath!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              "The Accuracy is ${confidence.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            Text(zosimusAeneus.edibility,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red,
                )),

            const SizedBox(
              height: 5,
            ),

            Text("Species: $label",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Text("Local name: ${zosimusAeneus.localName}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
              child: Text(zosimusAeneus.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Button Back to Home
            TagButton(label: label),

            // Text permission to use user's location
            const SizedBox(
              height: 50,
              width: 174,
              child: Text(
                textAlign: TextAlign.center,
                "Allow us to use your location to improve CAGRO's data.",
                style: TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PortunosPelagicus extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const PortunosPelagicus(
      {super.key,
      this.filePath,
      required this.confidence,
      required this.label});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Container
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: filePath == null
                      ? const Text('')
                      : Image.file(
                          filePath!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              "The Accuracy is ${confidence.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            Text(portunosPelagicus.edibility,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green,
                )),

            const SizedBox(
              height: 5,
            ),

            Text("Species: $label",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Text("Local name: ${portunosPelagicus.localName}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                )),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
              child: Text(portunosPelagicus.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Button Back to Home
            TagButton(label: label),

            // Text permission to use user's location
            const SizedBox(
              height: 50,
              width: 174,
              child: Text(
                textAlign: TextAlign.center,
                "Allow us to use your location to improve CAGRO's data.",
                style: TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InvalidData extends StatelessWidget {
  final File? filePath;
  const InvalidData({super.key, this.filePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Container
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: filePath == null
                      ? const Text('')
                      : Image.file(
                          filePath!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text("This image is invalid!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red,
                )),

            const SizedBox(
              height: 5,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 0.0),
              child: Text(
                  """Please ensure that the photo you’ve captured or uploaded is clear, and most importantly, that it depicts a legitimate crab species.""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 0.0),
              child: Text("Reupload/Retake your photo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),

            const SizedBox(
              height: 20,
            ),

            // Button Back to Home
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(
                  const Size(174, 50), // Set the desired width and height
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set your desired border radius
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    // Return the color when the button is pressed
                    return colorScheme.primary.withOpacity(0.5);
                  }
                  // Return the default color for the button
                  return colorScheme.primary;
                }),
              ),
              child: const Text(
                "Return to Home",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
