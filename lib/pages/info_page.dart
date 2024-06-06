import 'dart:io';

import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/data/data_widgets.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage(
      {super.key,
      required this.label,
      required this.confidence,
      this.filePath});

  final String label;
  final double confidence;
  final File? filePath;

  @override
  Widget build(BuildContext context) {
    late Widget crabInfo;
    // switch case to display crab info
    switch (label) {
      case 'Charybdis Feriatus':
        crabInfo = CharybdisFeriatus(
          filePath: filePath,
          confidence: confidence,
          label: label,
        );
        break;
      case 'Charybdis Natotor':
        crabInfo = CharybdisNatotor(
          filePath: filePath,
          confidence: confidence,
          label: label,
        );
        break;
      case 'Portunos Pelagicus':
        crabInfo = PortunosPelagicus(
          filePath: filePath,
          confidence: confidence,
          label: label,
        );
        break;
      case 'Zosimus Aeneus':
        crabInfo = ZosimusAeneus(
          filePath: filePath,
          confidence: confidence,
          label: label,
        );
        break;
      default:
        const InvalidData();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
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
      ),
      body: crabInfo,
    );
  }
}
