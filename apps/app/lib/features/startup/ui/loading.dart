import 'package:da_app/features/startup/ui/startup_widget.dart';
import 'package:flutter/material.dart';

class AppStartupLoading extends StatelessWidget {
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) => StartupWidget(
        child: (context) => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
