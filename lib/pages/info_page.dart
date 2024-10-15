import 'dart:io';

import 'package:crabcheck/components/report_button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:crabcheck/pages/crab_pages/invalid_page.dart';
import 'package:crabcheck/pages/crab_pages/metopograpsus_spp.dart';
import 'package:crabcheck/pages/crab_pages/portunos_pelagicus.dart';
import 'package:crabcheck/pages/crab_pages/scylla_serrata.dart';
import 'package:crabcheck/pages/crab_pages/venitus_latreillei.dart';
import 'package:crabcheck/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    late Widget crabInfo;
    // switch case to display crab info
    switch (label) {
      case 'Scylla Serrata':
        crabInfo = ScyllaSerrata(
          confidence: confidence,
          label: label,
          filePath: filePath,
        );
        break;
      case 'Portunos Pelagicus':
        crabInfo = PortunosPelagicus(
          confidence: confidence,
          label: label,
          filePath: filePath,
        );
        break;
      case 'Metopograpsus Spp':
        crabInfo = MetopograpsusSpp(
          confidence: confidence,
          label: label,
          filePath: filePath,
        );
        break;
      case 'Venitus Latreillei':
        crabInfo = VenitusLatreillei(
          confidence: confidence,
          label: label,
          filePath: filePath,
        );
        break;
      case 'NotValid':
        crabInfo = InvalidData(filePath: File(filePath.path));
        break;
      default:
        InvalidData(
          filePath: File(filePath.path),
        );
    }
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
          )
        ],
      ),
      body: crabInfo,
    );
  }
}
