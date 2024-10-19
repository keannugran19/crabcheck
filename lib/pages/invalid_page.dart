import 'dart:io';

import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../components/report_button.dart';

class InvalidData extends StatelessWidget {
  final File filePath;
  const InvalidData({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: ReportButton(),
          ),
        ],
      ),
      body: SafeArea(
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
          ],
        ),
      ),
    );
  }
}
