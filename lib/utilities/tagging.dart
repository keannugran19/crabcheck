import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firebase.dart';
import '../services/location.dart';

class Tagging {
  // call firebase storage and firestore
  FirebaseService firestore = FirebaseService();

  UploadTask? uploadTask;

  Future<GeoPoint> getUserLocation() async {
    final pos = await determinePosition();
    return GeoPoint(pos.latitude, pos.longitude);
  }

  Future<String> uploadFile(XFile file) async {
    final ref = firestore.storage('crabs/${file.name}');
    uploadTask = ref.putFile(File(file.path));
    await uploadTask!.whenComplete(() {});
    return await ref.getDownloadURL();
  }

  Future<void> saveToFirestore(
      GeoPoint location, String imageUrl, String label) async {
    // Fetch the address asynchronously
    final address = await firestore.getAddressFromCoordinates(location);

    // Create the crab data with the fetched address
    final crabData = {
      "species": label,
      "edibility": determineEdibility(label),
      "location": location,
      "address": address,
      "timestamp": Timestamp.now(),
      "image": imageUrl,
    };

    // Add the data to Firestore
    await firestore.crabs.add(crabData);
  }

  String determineEdibility(String species) {
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

  Future<void> showLoadingDialog(BuildContext context) async {
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

  Future<void> showSuccessDialog(BuildContext context) async {
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

  void showErrorSnackBar(dynamic error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to tag location: $error')),
    );
  }
}
