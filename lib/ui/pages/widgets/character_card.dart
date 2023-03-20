import 'package:flutter/material.dart';

import 'app_text.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    this.description,
  });

  final String imageUrl;
  final String name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: AppText.h3(name),
          ),
          const SizedBox(height: 12.0),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: AppText.h4('About character'),
          ),
          const SizedBox(height: 12.0),
          if (description != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: AppText.paragraph(description!.isEmpty ? 'Character description not available' : description!),
            ),
            const SizedBox(height: 12.0),
          ],
        ],
      ),
    );
  }
}
