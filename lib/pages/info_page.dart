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
                )
              ],
            ),
          ),
        ));
  }
}
