import 'package:flutter/material.dart';

import '../../../core/layout/screen_layout.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/phone_layout.dart';
import 'layouts/tablet_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ScreenLayout(
        mobileLayout: PhoneLayout(),
        tabletLayout: TabletLayout(),
        desktopLayout: DesktopLayout(),
      ),
    );
  }
}
