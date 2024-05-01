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
    const appName = "CRABCHECK";

    // Capture Image
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // About Us Button
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 20.0, 0.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("lib/assets/images/info.png"),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // Crabcheck Logo
            Column(
              children: [
                SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset("lib/assets/images/crabLogo.png")),
                Text(
                  appName,
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )
              ],
            ),

            const SizedBox(
              height: 60,
            ),

            // Capture button
            HomeButton(
              buttonText: "Capture",
              buttonColor: colorScheme.secondary,
              onPressed: () {
                captureImage();
              },
            ),

            const SizedBox(
              height: 20,
            ),

            HomeButton(
                buttonText: "Upload",
                buttonColor: colorScheme.secondary,
                onPressed: () {
                  uploadImage();
                }),
          ]),
        ),
      ),
    );
  }
}
