import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:merubo/pages/login/main.dart';
import 'package:merubo/pages/message_bord/main.dart';

final routerProvider = Provider((ref) => GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(
          path: '/message_bord',
          builder: (context, state) => const MessageBordPage()),
    ]));
