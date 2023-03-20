import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_heroes_app/ui/pages/home/widgets/tablet_card_widget.dart';

import '../../../../app_routes.dart';
import '../../../../core/values/constants.dart';
import '../../../../features/characters/presentation/bloc/characters_bloc.dart';
import '../../widgets/app_text.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText.paragraph('Characters'),
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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
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
                    child: TabletCard(
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
