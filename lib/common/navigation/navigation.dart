import 'package:da_app/features/counter/ui/page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CounterPage(),
    ),
  ],
);
