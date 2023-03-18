import 'package:flutter/material.dart';

import '../../../core/theme/texts.dart';
import '../../../core/utils/scale_size.dart';
import '../../../core/values/enums.dart';

class AppText extends StatelessWidget {
  const AppText.h1(this.text, {super.key, this.textType = TextType.h1});
  const AppText.h2(this.text, {super.key, this.textType = TextType.h2});
  const AppText.h3(this.text, {super.key, this.textType = TextType.h3});
  const AppText.h4(this.text, {super.key, this.textType = TextType.h4});
  const AppText.h5(this.text, {super.key, this.textType = TextType.h5});
  const AppText.h6(this.text, {super.key, this.textType = TextType.h6});
  const AppText.paragraphBold(this.text, {super.key, this.textType = TextType.paragraphB});
  const AppText.paragraphItalic(this.text, {super.key, this.textType = TextType.paragraphI});
  const AppText.paragraph(this.text, {super.key, this.textType = TextType.paragraph});

  final TextType textType;
  final String text;

  @override
  Widget build(BuildContext context) {
    switch (textType) {
      case TextType.h1:
        return Text(
          text,
          style: TextStyles.h1,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.h2:
        return Text(
          text,
          style: TextStyles.h2,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.h3:
        return Text(
          text,
          style: TextStyles.h3,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.h4:
        return Text(
          text,
          style: TextStyles.h4,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.h5:
        return Text(
          text,
          style: TextStyles.h5,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.h6:
        return Text(
          text,
          style: TextStyles.h6,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        );
      case TextType.paragraph:
        return Text(
          text,
          style: TextStyles.paragraph.normal,
          textScaleFactor: ScaleSize.textScaleFactor(
            context,
            maxTextScaleFactor: 1.1,
          ),
        );
      case TextType.paragraphB:
        return Text(
          text,
          style: TextStyles.paragraph.bold,
          textScaleFactor: ScaleSize.textScaleFactor(
            context,
            maxTextScaleFactor: 1.1,
          ),
        );
      case TextType.paragraphI:
        return Text(
          text,
          style: TextStyles.paragraph.italic,
          textScaleFactor: ScaleSize.textScaleFactor(
            context,
            maxTextScaleFactor: 1.1,
          ),
        );

      default:
        return Text(
          text,
        );
    }
  }
}
