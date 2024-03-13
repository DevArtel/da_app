import 'package:flutter/material.dart';

class ScreenStateBanner extends StatelessWidget {
  const ScreenStateBanner({
    required this.title,
    this.body,
    this.button,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? body;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final buttonChecked = button;
    final bodyChecked = body;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          if (bodyChecked != null) const SizedBox(height: 16),
          if (bodyChecked != null)
            Text(
              bodyChecked,
              textAlign: TextAlign.center,
            ),
          if (buttonChecked != null) const SizedBox(height: 16),
          if (buttonChecked != null) buttonChecked,
        ],
      ),
    );
  }
}
