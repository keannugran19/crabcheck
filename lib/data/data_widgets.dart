import 'dart:io';

import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class CharybdisFeriatus extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const CharybdisFeriatus(
      {super.key,
      this.filePath,
      required this.confidence,
      required this.label});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
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
                    borderRadius:
                        BorderRadius.circular(15) // Adjust the radius as needed
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

          Text(charybdisFeriatus.edibility,
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

          Text("Local name: ${charybdisFeriatus.localName}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              )),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 0.0),
            child: Text(charybdisFeriatus.description,
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
          Button(
              buttonText: "Tag to Map",
              buttonColor: colorScheme.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }),

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
            Button(
                buttonText: "Tag to Map",
                buttonColor: colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),

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
            Button(
                buttonText: "Tag to Map",
                buttonColor: colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),

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
            Button(
                buttonText: "Tag to Map",
                buttonColor: colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),

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
  const InvalidData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Invalid Data"),
    );
  }
}
