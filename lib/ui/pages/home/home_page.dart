import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/layout/screen_layout.dart';
import '../../../features/characters/presentation/bloc/characters_bloc.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/phone_layout.dart';
import 'layouts/tablet_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CharactersBloc>(context).add(GetCharactersEvent());
    });
  }

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
