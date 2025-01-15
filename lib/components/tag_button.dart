import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/pages/manual_tagging.dart';
import 'package:crabcheck/utilities/tagging.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'form_dialog.dart';

//* This button is responsible of tagging the location of the user to send to Database > Dashboard

class TagButton extends StatefulWidget {
  final String label;
  final XFile filePath;

  const TagButton({
    super.key,
    required this.label,
    required this.filePath,
  });

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  // call tagging util
  Tagging tagging = Tagging();

  bool _isLoading = false;

  String taggingType = '';

  @override
  Widget build(BuildContext context) {
    return Button(
      buttonText: "Tag to Map",
      buttonColor: colorScheme.primary,
      onPressed: _isLoading ? null : selectTaggingOption,
    );
  }

  Future<void> selectTaggingOption() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Tag Location',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      taggingType = 'automatic';
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: FormDialog(
                            label: widget.label,
                            filePath: widget.filePath,
                            taggingType: taggingType,
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Automatic',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10), // Add vertical spacing
                TextButton(
                  onPressed: () {
                    setState(() {
                      taggingType = 'manual';
                    });
                    navigateToManualTagging();
                  },
                  child: const Text(
                    'Manual',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    setState(() => _isLoading = true);
  }

  void navigateToManualTagging() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualLocationTaggingPage(
          filePath: widget.filePath,
          label: widget.label,
          taggingType: taggingType,
        ),
      ),
    );
  }
}
