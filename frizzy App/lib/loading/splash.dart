import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../heading.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headingGradient(),
            SizedBox(
              height: h*(0.08),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
