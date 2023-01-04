// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/views/bottom_view.dart';

final routesApp = Routes();

class Routes {
  static const String home = '/';

  final routes = GoRouter(
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
