import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  void initState() {
    super.initState();
    // Show the dialog after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Before using the App:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        content: const Text(
          """1.) Ensure that your camera lens is clean and free from dirt, as any impurities can negatively impact the image quality.

2.) Before CAPTURING, be sure to position the crab thoroughly within the camera frame. This ensures greater accuracy in your images.

3.) Before UPLOADING, make sure to crop the image so that it thoroughly captures the crab. This step ensures greater accuracy in your results.""",
          style: TextStyle(fontSize: 15, height: 1.5), // Improved readability
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Got It!');
            },
            child: const Text(
              'Got It!',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Return an empty, invisible widget
  }
}
