import 'package:crabcheck/components/dialog.dart';
import 'package:crabcheck/pages/about_page.dart';
import 'package:crabcheck/pages/howtouse_page.dart';
import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/components/home_button.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crabcheck/pages/info_page.dart';
import 'package:crabcheck/pages/loading_page.dart';
import 'dart:io';
import 'dart:developer' as devtools;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables for model result
  File? filePath;
  String label = '';
  double confidence = 0.0;

  // run the model
  Future<void> _tfLteInit() async {
    // ignore: unused_local_variable
    String? res = await Tflite.loadModel(
        model: "lib/assets/model/DenseNetv12.tflite",
        labels: "lib/assets/model/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
  }

// Upload Image
  uploadImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    // run the model on the image uploaded
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    // determine the accuracy and label
    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });

    // Loading before showing info page
    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const LoadingPage()),
    );

    // implement the loading
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InfoPage(
                  filePath: filePath,
                  label: label,
                  confidence: confidence,
                );
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
  }

// capture via camera
  captureImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    // run the model on image captured
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    // determine the accuracy and label
    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });

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
                return InfoPage(
                  filePath: filePath,
                  label: label,
                  confidence: confidence,
                );
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
  }

  // dispose the model
  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  //* HomePage user interface
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
              const DialogBox(),
            ],
          ),
        ),
      ),
    );
  }
}
