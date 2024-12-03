import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Access collection
CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('userReports');

class ReportDialog extends StatefulWidget {
  const ReportDialog({super.key});

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

bool imageChecked = false;
bool interfaceChecked = false;
bool othersChecked = false;
TextEditingController specifyField = TextEditingController();

class _ReportDialogState extends State<ReportDialog> {
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      // enable button if any checkbox is selected
      _isButtonEnabled = imageChecked || interfaceChecked || othersChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Submit Report",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const Text(
            "Tell us what you have encountered:",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          // Inaccurate result
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: WidgetStateProperty.resolveWith((states) =>
                    states.contains(WidgetState.pressed)
                        ? Colors.grey
                        : Colors.white),
                value: imageChecked,
                onChanged: (bool? value) {
                  setState(() {
                    imageChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("Result is Inaccurate")
            ],
          ),

          // Bug in the app UI
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: WidgetStateProperty.resolveWith((states) =>
                    states.contains(WidgetState.pressed)
                        ? Colors.grey
                        : Colors.white),
                value: interfaceChecked,
                onChanged: (bool? value) {
                  setState(() {
                    interfaceChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("User Interface bug")
            ],
          ),

          // Others
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: WidgetStateProperty.resolveWith((states) =>
                    states.contains(WidgetState.pressed)
                        ? Colors.grey
                        : Colors.white),
                value: othersChecked,
                onChanged: (bool? value) {
                  setState(() {
                    othersChecked = value!;
                  });
                  _updateButtonState();
                },
              ),
              const Text("Others")
            ],
          ),

          // Specify text field
          const Text("Please specify what you encountered:"),
          TextField(
            controller: specifyField,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type here',
            ),
          ),
          const SizedBox(height: 10),

          // Done button
          TextButton(
            onPressed: _isButtonEnabled
                ? () async {
                    // Data format to send to Firestore
                    final userReport = {
                      "innacurate": imageChecked,
                      "uiBug": interfaceChecked,
                      "others": othersChecked,
                      "specify": specifyField.text,
                      "timestamp": Timestamp.now()
                    };

                    // Add data to collection
                    await collectionRef.add(userReport);

                    Navigator.pop(context);
                  }
                : null, // Disable button when no checkbox is selected
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
