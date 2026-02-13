import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipedia_browser/screens/home.dart';
import 'package:wikipedia_browser/screens/search.dart';
import 'package:wikipedia_browser/screens/settings.dart';
import 'package:wikipedia_browser/widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _searchNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, _, navigationShell) =>
          ScaffoldWithNestedNavigation(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              name: 'home',
              path: '/',
              builder: (_, _) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _searchNavigatorKey,
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
      name: 'settings',
      path: '/settings',
      pageBuilder: (_, _) => CustomTransitionPage(
        child: SettingsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
              position: animation.drive(
                Tween(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            ),
      ),
    ),
  ],
);
