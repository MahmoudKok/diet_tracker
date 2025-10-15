import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:diet_tracker/src/core/router/custom_transition_builders.dart';

import 'app_routes.dart';

part 'routes.g.dart';

// Splash / Onboarding
@TypedGoRoute<SplashRoute>(path: AppRoutes.splash)
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return buildSlideTransition(
      context: context,
      state: state,
      child: const SizedBox.shrink(),
      name: '/',
    );
  }
}

@TypedGoRoute<HomeRoute>(path: AppRoutes.home)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  //TODO: Add HomeScreen
  Widget build(BuildContext context, GoRouterState state) =>
      const SizedBox.shrink();
}
