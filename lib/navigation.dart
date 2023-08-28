import 'package:go_router/go_router.dart';

import 'features/counter/ui/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CounterPage(),
    ),
  ],
);
