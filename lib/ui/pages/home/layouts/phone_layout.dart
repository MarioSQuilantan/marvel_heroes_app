import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_heroes_app/app_routes.dart';
import 'package:marvel_heroes_app/core/values/constants.dart';
import 'package:marvel_heroes_app/ui/pages/home/widgets/phone_card_widget.dart';

import '../../../../features/characters/presentation/bloc/characters_bloc.dart';
import '../../widgets/app_text.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText.paragraph('Characters'),
        elevation: 0,
      ),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        listener: (context, state) {
          if (state is CharactersHasError) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.message),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Accept'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Retry'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<CharactersBloc>(context).add(GetCharactersEvent());
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is CharactersIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CharactersHasData) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 18,
              ),
              itemCount: state.results.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < state.results.length) {
                  // Show your info
                  return GestureDetector(
                    onTap: () => AppRoutes.push(context, Routes.character, extra: state.results[index]),
                    child: PhoneCard(
                      imageUrl: '${state.results[index].thumbnail.path}.${state.results[index].thumbnail.extension}',
                      name: state.results[index].name,
                    ),
                  );
                  // return Text("$index");
                } else {
                  // getMoreData();
                  BlocProvider.of<CharactersBloc>(context).add(GetMoreCharactersEvent());
                  return const Center(child: CircularProgressIndicator());
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 22.0,
                );
              },
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => BlocProvider.of<CharactersBloc>(context).add(GetCharactersEvent()),
              child: const Text('fetch data'),
            ),
          );
        },
      ),
    );
  }
}
