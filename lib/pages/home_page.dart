import 'dart:io';

import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/components/home_button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  set image(File image) {}

  @override
  Widget build(BuildContext context) {
    // Capture Image
    // ignore: unused_local_variable
    File? imageCapture;
    Future captureImage() async {
      try {
        // Source: Camera
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    // Upload Image
    // ignore: unused_local_variable
    File? imageUpload;
    Future uploadImage() async {
      try {
        // Source: Camera
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0.0, screenHeight * 0.03, screenWidth * 0.05, 0.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.1,
                    child: Image.asset("lib/assets/images/info.png"),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.25,
                    child: Image.asset("lib/assets/images/crabLogo.png"),
                  ),
                  Text(
                    "CRABCHECK",
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.06),
              HomeButton(
                  buttonText: "Capture",
                  buttonColor: colorScheme.secondary,
                  onPressed: () {
                    captureImage();
                  }),
              SizedBox(height: screenHeight * 0.02),
              HomeButton(
                  buttonText: "Upload",
                  buttonColor: colorScheme.secondary,
                  onPressed: () {
                    uploadImage();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
