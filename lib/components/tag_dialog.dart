import 'package:flutter/material.dart';

class TagDialogBox extends StatefulWidget {
  const TagDialogBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TagDialogBoxState createState() => _TagDialogBoxState();
}

class _TagDialogBoxState extends State<TagDialogBox> {
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
        title: const Text("Successful!"),
        content: const Text(
          """We’ve successfully tagged the location where you found your crab! Thank you for contributing to the improvement of this application for future users!
          """,
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Done'),
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
