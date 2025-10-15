import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet_tracker/app/features/init_app/presentation/bloc/init_app_bloc.dart';
import 'package:diet_tracker/src/core/router/app_routes.dart';
import 'package:diet_tracker/src/core/router/custom_navigation_observer.dart';
import 'package:diet_tracker/src/core/router/fallback_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:diet_tracker/src/core/router/routes.dart';
import 'package:diet_tracker/src/core/widgets/default_button.dart';

import '../../logger/dev_logger.dart';
import '../../resources/color_provider.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter() : goRouter = _getRouter;
  final GoRouter goRouter;

  static late AppRouter _appRouter;

  static init() {
    _appRouter = AppRouter();
  }

  static GoRouter get getRouter => _appRouter.goRouter;
  //? Use for bottomNavigation bar
  // static final _shellKey = GlobalKey<NavigatorState>();

  static get _getRouter => GoRouter(
    navigatorKey: rootKey,
    initialLocation: AppRoutes.signIn,
    observers: [CustomNavigationObserver()],
    errorBuilder: (context, state) => const FallbackScreen(),
    routes: $appRoutes,
  );
}
/*<RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildSlideTransition(
            name: AppRoutes.splash,
            state: state,
            context: context,
            //MainScreen
            // child: MainScreen(),
            child: const TestColors(),
          );
        },
      ),
    ],*/

class TestColors extends StatelessWidget {
  const TestColors({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    Dev.logLine(Theme.of(context).brightness);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(width: 300, height: 100, color: colorProvider.dark),
          Container(
            width: 300,
            height: 100,
            color: colorProvider.surfaceNeutral,
          ),
          Container(width: 300, height: 100, color: colorProvider.error),

          DefaultButton(
            onTap: () {
              context.read<InitAppBloc>().add(ChangeAppThemeEvent());
            },
          ),
        ],
      ),
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
