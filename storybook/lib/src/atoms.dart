import 'package:storybook/src/atoms/app_text_input_story.dart';
import 'package:widgetbook/widgetbook.dart';

final atoms = [
  WidgetbookComponent(name: 'AppTextInput', useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const AppTextInputStory(),
    )
  ]),
];
