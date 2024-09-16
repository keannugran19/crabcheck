import 'dart:io';

import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class InvalidData extends StatelessWidget {
  final File filePath;
  const InvalidData({super.key, required this.filePath});

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
                filePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Dynamic scaling text
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("This image is invalid!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.red,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 0.0),
                    child: Text(
                        """Please ensure that the photo you’ve captured or uploaded is clear, and most importantly, that it depicts a legitimate crab species.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 0.0),
                    child: Text("Reupload/Retake your photo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
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
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
