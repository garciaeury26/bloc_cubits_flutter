import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    name: 'cubits',
    builder: (context, state) => const CubitsScreenCounter(),
  ),
  GoRoute(
    path: '/bloc',
    name: 'bloc',
    builder: (context, state) => const BlocScreenCounter(),
  ),
]);
