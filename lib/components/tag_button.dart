import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/services/location.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firebase.dart';

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
  // call firebase storage and firestore
  FirebaseService firestore = FirebaseService();

  UploadTask? uploadTask;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Button(
      buttonText: "Tag to Map",
      buttonColor: colorScheme.primary,
      onPressed: _isLoading ? null : _handleTagging,
    );
  }

  Future<void> _handleTagging() async {
    setState(() => _isLoading = true);

    // Show the "Please wait" dialog
    _showLoadingDialog();

    try {
      // Determine position and upload file
      final loc = await _getUserLocation();
      final downloadUrl = await _uploadFile(widget.filePath);

      // Save data to Firestore
      await _saveToFirestore(loc, downloadUrl);

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

  Future<GeoPoint> _getUserLocation() async {
    final pos = await determinePosition();
    return GeoPoint(pos.latitude, pos.longitude);
  }

  Future<String> _uploadFile(XFile file) async {
    final ref = firestore.storage('crabs/${file.name}');
    uploadTask = ref.putFile(File(file.path));
    await uploadTask!.whenComplete(() {});
    return await ref.getDownloadURL();
  }

  Future<void> _saveToFirestore(GeoPoint location, String imageUrl) async {
    // Fetch the address asynchronously
    final address = await firestore.getAddressFromCoordinates(location);

    // Create the crab data with the fetched address
    final crabData = {
      "species": widget.label,
      "edibility": _determineEdibility(widget.label),
      "location": location,
      "address": address,
      "timestamp": Timestamp.now(),
      "image": imageUrl,
    };

    // Add the data to Firestore
    await firestore.crabs.add(crabData);
  }

  String _determineEdibility(String species) {
    switch (species) {
      case "Charybdis Feriatus":
      case 'Scylla Serrata':
      case 'Portunos Pelagicus':
        return "Edible";
      case 'Venitus Latreillei':
      case 'Metopograpsus Spp':
        return "Inedible";
      default:
        return "Unknown";
    }
  }

  Future<void> _showLoadingDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Uploading Data'),
          content: Text(
              "Please wait while we upload your image, location, and crab data to the CAGRO database. This may take a few moments."),
        );
      },
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
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to tag location: $error')),
    );
  }
}
