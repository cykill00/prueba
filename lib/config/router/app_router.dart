import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const BottonsScreen()
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardScreen()
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen()
    ),
    GoRoute(
      path: '/snackbars',
      builder: (context, state) => const SnackBarScreen()
    ),

    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen()
    ),
    
    GoRoute(
      path: '/ui-controls',
      builder: (context, state) => const UiControlScreen()
    ),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen()
    ),
     GoRoute(
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen()
    ), 

  ]

);