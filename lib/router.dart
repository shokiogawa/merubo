import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:merubo/model/provider/auth_provider.dart';
import 'package:merubo/pages/login/main.dart';
import 'package:merubo/pages/message_bord/main.dart';

final routerProvider = Provider((ref) => GoRouter(
      routes: [
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(
            path: '/', builder: (context, state) => const MessageBordPage()),
      ],
      redirect: (context, state) async {
        final isLoggedIn = await ref.read(authProvider).isLogIn();
        if (!isLoggedIn) {
          print(state.subloc);
          return state.subloc == '/login' ? null : '/login';
        }
        return null;
      },
    ));
