import 'dart:io';

import 'package:crabcheck/components/report_button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data.dart';
import 'package:crabcheck/pages/invalid_page.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/tag_button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.label,
    required this.confidence,
    required this.filePath,
  });

  final String label;
  final double confidence;
  final XFile filePath;

  Widget _buildTableCell({required String text, bool isTitle = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: isTitle ? const TextStyle(fontWeight: FontWeight.bold) : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Crab data stored in a map to avoid switch-case repetition
    final crabInfo = {
      'Scylla Serrata': scyllaSerrata,
      'Portunos Pelagicus': portunosPelagicus,
      'Metopograpsus Spp': metopograpsusSpp,
      'Venitus Latreillei': venitusLatreillei,
    };

    final crabData = crabInfo[label];

    // redirect if Invalid Crab
    if (crabData == null) {
      return InvalidData(filePath: File(filePath.path));
    }

    // table for info page
    var infoTable = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              _buildTableCell(text: 'Species', isTitle: true),
              _buildTableCell(text: crabData.species),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(text: 'Local Name', isTitle: true),
              _buildTableCell(text: crabData.localName),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(text: 'Family', isTitle: true),
              _buildTableCell(text: crabData.family),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(text: 'Habitat', isTitle: true),
              _buildTableCell(text: crabData.habitat),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(text: 'Appearance', isTitle: true),
              _buildTableCell(text: crabData.appearance),
            ],
          ),
        ],
      ),
    );

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
          "Result",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: ReportButton(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Image Container
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  crabData.edibility,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            // Info Table
            Expanded(
              child: SingleChildScrollView(child: infoTable),
            ),

            const SizedBox(height: 5),

            // Button Back to Home
            TagButton(label: label, filePath: filePath),

            const SizedBox(
              width: 174,
              child: Text(
                "Allow us to use your location to improve CAGRO's data.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
