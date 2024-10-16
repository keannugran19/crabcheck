import 'dart:io';

import 'package:crabcheck/components/tag_button.dart';
import 'package:crabcheck/data/data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VenitusLatreillei extends StatelessWidget {
  final double confidence;
  final String label;
  final XFile filePath;
  const VenitusLatreillei({
    super.key,
    required this.confidence,
    required this.label,
    required this.filePath,
  });

  Widget buildTableCell(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var infoTable = LayoutBuilder(
      builder: (context, constraints) {
        return Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                buildTableCell('Portunidae'),
                buildTableCell('Value 1'),
              ],
            ),
            TableRow(
              children: [
                buildTableCell('Cancridae'),
                buildTableCell('Value 2'),
              ],
            ),
            TableRow(
              children: [
                buildTableCell('Gecarcinidae'),
                buildTableCell('Value 3'),
              ],
            ),
            TableRow(
              children: [
                buildTableCell('Ocypodidae'),
                buildTableCell('Value 4'),
              ],
            ),
            TableRow(
              children: [
                buildTableCell('Xanthidae'),
                buildTableCell('Value 5'),
              ],
            ),
          ],
        );
      },
    );

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Image Container
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.9,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.file(
                File(filePath.path),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Column(
            children: [
              Text(
                "The Accuracy is ${confidence.toStringAsFixed(0)}%",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                venitusLatreillei.edibility,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          // Dynamic scaling text
          Expanded(
            child: SingleChildScrollView(child: infoTable),
          ),

          // Button Back to Home
          TagButton(
            label: label,
            filePath: filePath,
          ),

          const SizedBox(
            width: 174,
            child: Text(
              textAlign: TextAlign.center,
              "Allow us to use your location to improve CAGRO's data.",
              style: TextStyle(fontSize: 10),
            ),
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
