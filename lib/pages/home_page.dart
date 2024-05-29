import 'dart:io';

import 'package:crabcheck/pages/about_page.dart';
import 'package:crabcheck/pages/howtouse_page.dart';
import 'package:crabcheck/pages/info_page.dart';
import 'package:crabcheck/pages/loading_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/components/home_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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

        // Loading before showing info page
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const LoadingPage()),
        );

        return FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 3),
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InfoPage();
                  },
                ),
                (route) => false,
              );
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const LoadingPage();
            }
            return Container();
          },
        );
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

        // Loading before showing info page
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const LoadingPage()),
        );

        return FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 3),
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InfoPage();
                  },
                ),
                (route) => false,
              );
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const LoadingPage();
            }
            return Container();
          },
        );
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('lib/assets/images/loginbackground.png'),
                      fit: BoxFit.cover)),
              child: Text(
                'CRABCHECK',
                style: TextStyle(
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            ListTile(
              title: const Text('How to use our App?'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HowPage()),
                );
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Column(
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
