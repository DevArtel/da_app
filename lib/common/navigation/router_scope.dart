import 'package:da_app/features/counter/navigation/routes.dart' as counter_routes;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef RouterScopeBuilder = Widget Function(
  BuildContext context,
  GoRouter router,
);

/// Widget that encapsulates [GoRouter] instance creation.
class RouterScope extends StatefulWidget {
  const RouterScope({
    required this.builder,
    super.key,
  });

  final RouterScopeBuilder builder;

  @override
  State<RouterScope> createState() => _RouterScopeState();
}

class _RouterScopeState extends State<RouterScope> {
  final _router = GoRouter(
    routes: [
      ...counter_routes.$appRoutes,
    ],
  );

  @override
  Widget build(BuildContext context) => widget.builder(context, _router);
}
