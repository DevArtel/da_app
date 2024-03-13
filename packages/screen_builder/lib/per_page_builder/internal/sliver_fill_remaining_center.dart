import 'package:flutter/material.dart';

class SliverFillRemainingCenter extends StatelessWidget {
  const SliverFillRemainingCenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: child,
      ),
    );
  }
}
