import 'package:flutter/material.dart';

class TagDialogBox extends StatefulWidget {
  const TagDialogBox({super.key});

  @override
  _TagDialogBoxState createState() => _TagDialogBoxState();
}

class _TagDialogBoxState extends State<TagDialogBox> {
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
          "Success!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        content: const Text(
          """We’ve successfully tagged the location where you found your crab! Thank you for contributing to the improvement of this application for future users!""",
          style: TextStyle(fontSize: 15, height: 1.5),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.blueAccent, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Return an invisible widget
  }
}
