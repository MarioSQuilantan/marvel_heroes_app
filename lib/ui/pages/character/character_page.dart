import 'package:flutter/material.dart';

import '../../../core/layout/screen_layout.dart';
import '../../../features/characters/domain/entities/characters/result_entity.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/phone_layout.dart';
import 'layouts/tablet_layout.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    super.key,
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenLayout(
        mobileLayout: PhoneLayout(result: result),
        tabletLayout: const TabletLayout(),
        desktopLayout: const DesktopLayout(),
      ),
    );
  }
}
