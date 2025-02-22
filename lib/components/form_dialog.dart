import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utilities/tagging.dart';

// ignore: must_be_immutable
class FormDialog extends StatefulWidget {
  final String label;
  final XFile filePath;
  final String taggingType;
  double latitude;
  double longitude;
  FormDialog({
    super.key,
    required this.label,
    required this.filePath,
    this.latitude = 0.0,
    this.longitude = 0.0,
    required this.taggingType,
  });

  @override
  State<FormDialog> createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  // call tagging util
  Tagging tagging = Tagging();

  bool isLoading = false;

  // text controllers for the form
  TextEditingController name = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController userAddress = TextEditingController();

  // method to set the location manually
  Future<void> manualTagging() async {
    setState(() => isLoading = true);

    // Show the "Please wait" dialog
    tagging.showLoadingDialog(context);

    try {
      // Determine position and upload file
      final loc = GeoPoint(widget.latitude, widget.longitude);
      final downloadUrl = await tagging.uploadFile(widget.filePath);

      // Save data to Firestore
      await tagging.saveToFirestore(loc, downloadUrl, widget.label, name.text,
          occupation.text, userAddress.text);

      // Close loading dialog after upload is complete
      if (mounted) Navigator.of(context).pop();

      // Show success dialog
      if (mounted) tagging.showSuccessDialog(context);
    } catch (e) {
      // Close loading dialog in case of an error
      if (mounted) Navigator.of(context).pop();

      // ignore: use_build_context_synchronously
      tagging.showErrorSnackBar(e, context);
    } finally {
      setState(() => isLoading = false);
    }
  }

  // method to set the location automatically
  Future<void> automaticTagging() async {
    setState(() => isLoading = true);

    // Show the "Please wait" dialog
    tagging.showLoadingDialog(context);

    try {
      // Determine position and upload file
      final loc = await tagging.getUserLocation();
      final downloadUrl = await tagging.uploadFile(widget.filePath);

      // Save data to Firestore
      await tagging.saveToFirestore(loc, downloadUrl, widget.label, name.text,
          occupation.text, userAddress.text);

      // Close loading dialog after upload is complete
      if (mounted) Navigator.of(context).pop();

      // Show success dialog
      if (mounted) tagging.showSuccessDialog(context);
    } catch (e) {
      // Close loading dialog in case of an error
      if (mounted) Navigator.of(context).pop();

      // ignore: use_build_context_synchronously
      tagging.showErrorSnackBar(e, context);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // form key
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Widget buildTextField(String label, TextEditingController controller) {
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your details';
          }
          return null;
        },
      );
    }

    // reusable widgets
    var formTitleStyle = const TextStyle(
      fontWeight: FontWeight.w500,
    );

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Fill up this form",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const Text(
                "Please input your details for data collection:",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              // form to fill up for the user
              Text(
                "Name:",
                style: formTitleStyle,
              ),
              buildTextField("e.g. Juan Dela Cruz", name),
              const SizedBox(height: 10),
              // Occupation text field
              Text(
                "Occupation:",
                style: formTitleStyle,
              ),
              buildTextField("e.g. Student, Farmer etc.", occupation),
              const SizedBox(height: 10),
              // address text field
              Text(
                "Address:",
                style: formTitleStyle,
              ),
              buildTextField("e.g. Brgy. Gredu", userAddress),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       name.text = 'Unspecified';
                  //       occupation.text = 'Unspecified';
                  //       userAddress.text = 'Unspecified';
                  //     });

                  //     if (widget.taggingType == 'manual') {
                  //       manualTagging();
                  //     } else {
                  //       automaticTagging();
                  //     }
                  //   },
                  //   child: const Text('Skip'),
                  // ),
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (widget.taggingType == 'manual') {
                          manualTagging();
                        } else {
                          automaticTagging();
                        }
                      }
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
