import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText.paragraph('Desktop'),
      ),
      body: Container(),
    );
  }
}
