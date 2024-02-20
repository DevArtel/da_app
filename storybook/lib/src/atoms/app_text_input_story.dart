import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';

class AppTextInputStory extends StatelessWidget {
  const AppTextInputStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppTextField(
        placeholderText: context.knobs.stringOrNull(label: 'Placeholder', initialValue: 'Enter your address'),
      ),
    );
  }
}
