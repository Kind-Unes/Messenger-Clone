import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute customTransitionRoute(
    Widget widget, String path, String name, List<RouteBase> routes) {
  return GoRoute(
    path: path,
    name: name,
    routes: routes,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  );
}
