import 'package:crabcheck/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportButton extends StatelessWidget {
  final XFile filePath;
  const ReportButton({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ReportDialog(
                filePath: filePath,
              ),
            );
          },
        );
      },
      child: const Text(
        "REPORT",
      ),
    );
  }
}
