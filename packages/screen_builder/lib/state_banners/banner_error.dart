import 'package:flutter/material.dart';
import 'package:screen_builder/state_banners/internal/screen_state_banner.dart';

class BannerError extends StatelessWidget {
  const BannerError({
    this.error,
    this.onRetryPressed,
    Key? key,
  }) : super(key: key);

  final Object? error;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return ScreenStateBanner(
      title: 'Oops something went utterly wrong. ',
      button: ElevatedButton(
        onPressed: onRetryPressed,
        child: const Text('Retry'),
      ),
    );
  }
}
