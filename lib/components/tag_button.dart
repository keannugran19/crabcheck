import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/components/tag_dialog.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/constants/location.dart';
import 'package:flutter/material.dart';

//* This button is responsible of tagging the location of the user to send to Database > Dashboard

// access collection
CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('crabData');

class TagButton extends StatelessWidget {
  final String label;

  const TagButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // switch to determine edibility
    String edibility = "";

    switch (label) {
      case "Charybdis Feriatus":
        edibility = "Edible";
        break;
      case 'Charybdis Natotor':
        edibility = "Edible";
        break;
      case 'Portunos Pelagicus':
        edibility = "Edible";
        break;
      case 'Zosimus Aeneus':
        edibility = "Inedible";
      default:
    }

    return Button(
        buttonText: "Tag to Map",
        buttonColor: colorScheme.primary,
        onPressed: () async {
          determinePosition();

          final pos = await determinePosition();
          final loc = GeoPoint(pos.latitude, pos.longitude);

          // data format to send to firestore
          final crab = <String, Object>{
            "species": label,
            "edibility": edibility,
            "location": loc,
            "timestamp": Timestamp.now()
          };

          // add data to collection
          FirebaseFirestore.instance.collection('crabData').add(crab);

          // prompt user after tagging location
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) => const TagDialogBox(),
          );
        });
  }
}
