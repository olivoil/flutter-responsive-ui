import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:recruiting/screens/job_applicant/job_applicant.dart';

// ignore: avoid_classes_with_only_static_members
/// Routing configuration
class Routes {
  /// public constructor, returns a singleton instance
  factory Routes() => _instance;

  // internal constructor
  Routes._internal() {
    router.notFoundHandler = Handler(handlerFunc: _notFoundHandlerFunc);
    router.define(main, handler: Handler(handlerFunc: _mainHandlerFunc));
  }

  // Singleton instance
  static final Routes _instance = Routes._internal();

  // routes
  static const String main = "/";

  // router
  final FluroRouter router = FluroRouter();

  /// 404 handler
  Widget? _notFoundHandlerFunc(
      BuildContext? context, Map<String, List<String>> params) {
    return const JobApplicantScreen();
  }

  /// handler for the main route
  Widget _mainHandlerFunc(
      BuildContext? context, Map<String, List<String>> params) {
    return const JobApplicantScreen();
  }
}
