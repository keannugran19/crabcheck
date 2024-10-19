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

    var border = BorderRadius.circular(15);

    var textStyle = const TextStyle(fontSize: 18);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: border,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: border,
                      child: Image(
                        height: 180,
                        width: size.width,
                        fit: BoxFit.cover,
                        image: AssetImage(crabs.image),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        crabs.species,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(crabs.edibility,
                          style: TextStyle(
                            fontSize: 18,
                            color: crabs.edibility == "Edible!"
                                ? Colors.green
                                : Colors.red,
                          )),
                      Text(crabs.localName, style: textStyle),
                      Text(crabs.family, style: textStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
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
      body: Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return buildCrabs(context, index);
              },
              itemCount: crabList.length)),
    );
  }
}
