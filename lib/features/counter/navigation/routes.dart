import 'package:da_app/features/counter/ui/counter_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<CounterRoute>(path: '/counter')
class CounterRoute extends GoRouteData {
  const CounterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterScreen();
  }
}
