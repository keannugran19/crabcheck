import 'package:crabcheck/components/dialog.dart';
import 'package:crabcheck/pages/about_page.dart';
import 'package:crabcheck/pages/crab_list.dart';
import 'package:crabcheck/pages/howtouse_page.dart';
import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/components/home_button.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crabcheck/pages/info_page.dart';
import 'package:crabcheck/pages/loading_page.dart';
import 'dart:developer' as devtools;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables for model result
  XFile? filePath;
  String label = '';
  double confidence = 0.0;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  // Load model once during init
  Future<void> _loadModel() async {
    await Tflite.loadModel(
      model: "lib/assets/model/mobilenet1.tflite",
      labels: "lib/assets/model/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  // Common image processing function
  Future<void> _processImage(String path) async {
    var recognitions = await Tflite.runModelOnImage(
      path: path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        confidence = recognitions[0]['confidence'] * 100;
        label = recognitions[0]['label'].toString();
      });
      devtools.log("Recognition: $recognitions");
    } else {
      devtools.log("Recognitions are null");
    }

    _navigateToInfoPage();
  }

  Future<void> _navigateToInfoPage() async {
    // First, navigate to the LoadingPage and ensure it appears immediately
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoadingPage()),
    );

    // Delay for 3 seconds after LoadingPage is shown
    await Future.delayed(const Duration(seconds: 3));

    // After the delay, navigate to the InfoPage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => InfoPage(
          filePath: filePath!,
          label: label,
          confidence: confidence,
        ),
      ),
    );
  }

  // Image picker function (common for both upload and capture)
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: source, maxHeight: 224, maxWidth: 224);
    if (image != null) {
      filePath = image;
      setState(() {});
      await _processImage(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/loginbackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'CRABCHECK',
                    style: TextStyle(
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                      ],
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.book, color: colorScheme.primary),
                  title: const Text(
                    'Crabs List',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CrabList()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline, color: colorScheme.primary),
                  title: const Text(
                    'How to use our App?',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HowPage()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ), // Adds separation
                ListTile(
                  leading: Icon(Icons.info, color: colorScheme.primary),
                  title: const Text(
                    'About Us',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutPage()),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              SizedBox(height: screenHeight * 0.02),
              HomeButton(
                buttonText: "Upload",
                buttonColor: colorScheme.secondary,
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
              const DialogBox(),
            ],
          ),
        ),
      ),
    );
  }
}
