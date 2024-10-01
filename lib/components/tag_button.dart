import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/components/tag_dialog.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/model/location.dart';
import 'package:flutter/material.dart';

//* This button is responsible of tagging the location of the user to send to Database > Dashboard

class TagButton extends StatefulWidget {
  final String label;

  const TagButton({
    super.key,
    required this.label,
  });

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Determine edibility based on label
    String edibility = _determineEdibility(widget.label);

    return Stack(
      alignment: Alignment.center,
      children: [
        Button(
          buttonText: "Tag to Map",
          buttonColor: colorScheme.primary,
          onPressed: () async {
            setState(() {
              _isLoading = true; // Start loading
            });

            try {
              // Determine the position
              final pos = await determinePosition();
              final loc = GeoPoint(pos.latitude, pos.longitude);

              // Data to send to Firestore
              final crab = <String, Object>{
                "species": widget.label,
                "edibility": edibility,
                "location": loc,
                "timestamp": Timestamp.now(),
              };

              // Add data to Firestore collection
              await FirebaseFirestore.instance.collection('crabData').add(crab);

              // After successful addition, show the dialog
              if (mounted) {
                _showSuccessDialog();
              }
            } catch (e) {
              // Handle any errors here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to tag location: $e')),
              );
            } finally {
              setState(() {
                _isLoading = false; // Stop loading
              });
            }
          },
        ),
        if (_isLoading) const CircularProgressIndicator(),
      ],
    );
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

  Future<void> _showSuccessDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => const TagDialogBox(),
    );
  }
}
