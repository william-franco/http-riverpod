import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http_riverpod/src/features/bottom/presentation/views/bottom_view.dart';

class Routes {
  Routes._();

  static const String home = '/';

  static final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const CupertinoPage(
          child: BottomView(),
        ),
      ),
    ],
  );
}
