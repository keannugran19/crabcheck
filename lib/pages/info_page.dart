import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          leading: const BackButton(
            color: Colors.black,
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
                      child: Image.asset(scyllaSerrata.crabImage,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
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

                Text("Species: ${scyllaSerrata.species}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    )),

                Text("Local name: ${scyllaSerrata.localName}",
                    style: const TextStyle(
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
                    onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
