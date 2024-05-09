import 'package:flutter/material.dart';

class HowPage extends StatelessWidget {
  const HowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Center(
                  child: Text(
                "How to use our app?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                """ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed pretium lacus, at pretium orci. Curabitur porttitor est nec orci aliquet imperdiet. Pellentesque risus nibh, commodo in lectus vitae, tincidunt interdum lorem. Maecenas ultrices ac dolor nec finibus. Praesent sed dui finibus, vulputate enim efficitur, finibus est. Nam non lectus lorem. Curabitur interdum sapien lacus, quis porttitor orci dignissim sed. Aliquam pharetra dolor a consequat viverra. Duis ac neque lacus. Quisque eu ultricies diam. Nam bibendum, leo eu tincidunt cursus, massa eros luctus libero, rutrum tincidunt diam mauris eget tellus. Nullam et posuere orci. Ut eget viverra nisl. Pellentesque eget bibendum nibh, sit amet accumsan quam.
            
              Quisque auctor risus nec felis pulvinar, ut tincidunt turpis pharetra. Etiam faucibus tempus porttitor. Ut euismod urna sit amet leo porttitor bibendum in eu nunc. Donec at dui in magna tristique mollis. Maecenas tempor neque at varius pretium. Aliquam rhoncus ullamcorper lorem eget vestibulum. Nunc venenatis accumsan bibendum. Nullam pharetra, augue vel iaculis efficitur, odio elit posuere metus, ac ullamcorper purus sem in orci. Phasellus erat leo, faucibus eu enim non, egestas varius tellus. Vivamus vestibulum semper mi, non rhoncus lacus feugiat ac. Nullam laoreet velit at nibh scelerisque molestie. Maecenas elementum mi massa, at porta nisl rhoncus commodo.
            
              Proin augue lacus, vehicula quis tempus id, scelerisque congue nisi. Proin auctor odio eu justo consectetur, eget laoreet dolor facilisis. Morbi non augue ac purus commodo pretium. Donec mollis diam metus, id consectetur quam rutrum id. Etiam suscipit volutpat semper. Proin ut consequat est. Ut convallis magna non gravida molestie. Vestibulum quis nibh quis velit iaculis euismod id in massa. Maecenas justo dui, consequat id venenatis sit amet, venenatis sagittis sem. Aenean molestie condimentum tincidunt.""",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
