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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Before using the App:"),
        content: const Text(
            """1.) Ensure that your camera lens is clean and free from dirt, as any impurities can negatively impact the image quality.

2.) Before CAPTURING, be sure to position the crab thoroughly within the camera frame when capturing it. This ensures greater accuracy in your images.

3.) Before UPLOADING, make sure to crop the image so that it thoroughly captures the crab. This step ensures greater accuracy in your results.
          """),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Got It!');
            },
            child: const Text('Got It!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container as no UI is needed here
  }
}
