import 'package:flutter/material.dart';

class AppConfigService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?>? pushNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? offNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static void back<T>({
    T? result,
  }) {
    navigatorKey.currentState?.pop(result);
  }

  static Future<T?>? offAllNamed<T>(
    String route, {
    RoutePredicate? predicate,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }
}
