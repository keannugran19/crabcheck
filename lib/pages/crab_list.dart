import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/model/crab_info.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import 'home_page.dart';

class CrabList extends StatefulWidget {
  const CrabList({super.key});

  @override
  State<CrabList> createState() => _CrabListState();
}

class _CrabListState extends State<CrabList> {
  Widget buildCrabs(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    Crab crabs = crabList[index];

    var border = BorderRadius.circular(20);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Card(
        elevation: 6, // Increased shadow elevation
        shape: RoundedRectangleBorder(
          borderRadius: border,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: border.topLeft),
              child: Image(
                height: 200, // Increased image height
                width: size.width,
                fit: BoxFit.cover,
                image: AssetImage(crabs.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crabs.species,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        crabs.edibility == "Edible!"
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: crabs.edibility == "Edible!"
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        crabs.edibility,
                        style: TextStyle(
                          fontSize: 18,
                          color: crabs.edibility == "Edible!"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Local Name: ${crabs.localName}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Family: ${crabs.family}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          "Crabs List",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return buildCrabs(context, index);
          },
          itemCount: crabList.length),
    );
  }
}
