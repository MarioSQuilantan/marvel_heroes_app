import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_heroes_app/ui/pages/widgets/app_text.dart';

import '../../../../features/characters/presentation/bloc/characters_bloc.dart';

class PhoneLayout extends StatefulWidget {
  const PhoneLayout({super.key});

  @override
  State<PhoneLayout> createState() => _PhoneLayoutState();
}

class _PhoneLayoutState extends State<PhoneLayout> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CharactersBloc>(context).add(GetCharactersEvent());
    });
  }

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
                      onTap: () {},
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Material(
                              child: Container(
                                height: 270.0,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${state.results[index].thumbnail.path}.${state.results[index].thumbnail.extension}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: AppText.h3(state.results[index].name),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: AppText.h4('About character'),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ));
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
