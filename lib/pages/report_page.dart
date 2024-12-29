import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firebase.dart';

// Access collection
CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('userReports');

class ReportDialog extends StatefulWidget {
  final XFile filePath;
  const ReportDialog({super.key, required this.filePath});

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  // call firebase storage and firestore
  FirebaseService firestore = FirebaseService();
  bool _isButtonEnabled = false;

  // file
  UploadTask? uploadTask;
  // loading
  bool _isLoading = false;

  // checkboxes and text field
  bool isImageChecked = false;
  bool isUnclassifiedChecked = false;
  bool isOthersChecked = false;
  TextEditingController specifyField = TextEditingController();

  void _updateButtonState() {
    setState(() {
      // enable button if any checkbox is selected
      _isButtonEnabled =
          isImageChecked || isUnclassifiedChecked || isOthersChecked;
    });
  }

  // report text button functionaility
  Future<void> report() async {
    setState(() => _isLoading = true);

    _showLoadingDialog();

    try {
      final downloadUrl = await _uploadFile(widget.filePath);
      // Save data to Firestore
      await _saveToFirestore(downloadUrl);
      // Close loading dialog after upload is complete
      if (mounted) Navigator.of(context).pop();

      // Show success dialog
      if (mounted) _showSuccessDialog();
    } catch (e) {
      // Close loading dialog in case of an error
      if (mounted) Navigator.of(context).pop();

      _showErrorSnackBar(e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorSnackBar(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send report: $error')),
    );
  }

  Future<void> _showSuccessDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Success!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        content: const Text(
          """We’ve successfully sent your report to CAGRO Admin. Thank you for your contribution.""",
          style: TextStyle(fontSize: 15, height: 1.5),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveToFirestore(String imageUrl) async {
    // Fetch the address asynchronously

    // Data format to send to Firestore
    final userReport = {
      "image": imageUrl,
      "innacurate": isImageChecked,
      "unclassified": isUnclassifiedChecked,
      "others": isOthersChecked,
      "specify": specifyField.text,
      "timestamp": Timestamp.now()
    };

    // Add data to collection
    await collectionRef.add(userReport);
  }

  Future<String> _uploadFile(XFile file) async {
    final ref = firestore.storage('reports/${file.name}');
    uploadTask = ref.putFile(File(file.path));
    await uploadTask!.whenComplete(() {});
    return await ref.getDownloadURL();
  }

  Future<void> _showLoadingDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Uploading Data'),
          content: Text(
              "Please wait while we upload your report to CAGRO Admin. This may take a few moments."),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // reusable widgets
    var fillColor = WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.pressed) ? Colors.grey : Colors.white);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Submit Report",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const Text(
            "Tell us what you have encountered:",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          // Inaccurate result
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: fillColor,
                value: isImageChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isImageChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("Result is Inaccurate")
            ],
          ),

          // Bug in the app UI
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: fillColor,
                value: isUnclassifiedChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isUnclassifiedChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("Crab is unclassified")
            ],
          ),

          // Others
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: fillColor,
                value: isOthersChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isOthersChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("Others")
            ],
          ),

          // Specify text field
          const Text("Please specify what you encountered:"),
          TextField(
            controller: specifyField,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type here',
            ),
          ),
          const SizedBox(height: 10),

          // Done button
          TextButton(
            onPressed: _isButtonEnabled
                ? () {
                    // Report the image
                    report();
                    Navigator.pop(context);
                  }
                : null, // Disable button when no checkbox is selected
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
