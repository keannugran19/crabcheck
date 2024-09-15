import 'package:flutter/material.dart';

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
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.white;
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
                fillColor: WidgetStateProperty.resolveWith(getColor),
                value: imageChecked,
                onChanged: (bool? value) {
                  setState(() {
                    imageChecked = value!;
                  });
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
                fillColor: WidgetStateProperty.resolveWith(getColor),
                value: interfaceChecked,
                onChanged: (bool? value) {
                  setState(() {
                    interfaceChecked = value!;
                  });
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
                fillColor: WidgetStateProperty.resolveWith(getColor),
                value: othersChecked,
                onChanged: (bool? value) {
                  setState(() {
                    othersChecked = value!;
                  });
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
