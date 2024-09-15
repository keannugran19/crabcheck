import 'package:crabcheck/pages/report_page.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({super.key});

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
              child: const ReportDialog(), // Reuse ReportPage content
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
