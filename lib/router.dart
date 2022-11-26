import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:merubo/model/provider/auth_provider.dart';
import 'package:merubo/screen/message_bord_screen/main.dart';
import 'screen/login_screen/main.dart';
import 'screen/top_screen/main.dart';

final routerProvider = Provider((ref) => GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const TopPage()),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(
            path: '/message_bord',
            builder: (context, state) => const MessageBordPage())
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
