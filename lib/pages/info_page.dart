import 'dart:io';

import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final File? filePath;
  final double confidence;
  final String label;
  const InfoPage(
      {super.key,
      required this.confidence,
      required this.label,
      this.filePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          title: const Text(
            "Result",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                Text(scyllaSerrata.edibility,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green,
                    )),

                const SizedBox(
                  height: 20,
                ),

                Text("Species: $label",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    )),

                const Text("Local name: Lambay",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0.0),
                  child: Text(scyllaSerrata.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      )),
                ),

                const SizedBox(
                  height: 50,
                ),

                // Button Back to Home
                Button(
                    buttonText: "Back to Home",
                    buttonColor: colorScheme.secondary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
