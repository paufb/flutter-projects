import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipedia_browser/screens/home.dart';
import 'package:wikipedia_browser/screens/page.dart';
import 'package:wikipedia_browser/screens/search.dart';
import 'package:wikipedia_browser/screens/settings.dart';
import 'package:wikipedia_browser/widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, _, navigationShell) =>
          ScaffoldWithNestedNavigation(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'home',
              path: '/',
              builder: (_, _) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'search',
              path: '/search',
              builder: (_, _) => const SearchScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'page',
      path: '/page/:title',
      builder: (_, state) => PageScreen(title: state.pathParameters['title']!),
    ),
    GoRoute(
      name: 'settings',
      path: '/settings',
      pageBuilder: (_, _) => CustomTransitionPage(
        child: const SettingsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            ),
      ),
    ),
  ],
);
