import 'package:flutter/material.dart';
import 'package:crabcheck/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = "CRABCHECK";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // About Us Button
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 20.0, 0.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("lib/assets/images/info.png"),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // Crabcheck Logo
            Column(
              children: [
                SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset("lib/assets/images/crabLogo.png")),
                Text(
                  appName,
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
