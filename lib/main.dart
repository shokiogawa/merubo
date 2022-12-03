import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/screen/login_screen/main.dart';
import 'package:merubo/screen/message_bord_create_screen/main.dart';
import 'package:merubo/screen/message_bord_screen/main.dart';
import 'package:merubo/screen/preview_screen/main.dart';
import 'package:merubo/screen/top_screen/main.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Merubo",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const InitPage(),
      routes: {
        '/top': (context) => const TopScreen(),
        '/login': (context) => const LoginScreen(),
        '/message_bord': (context) => const MessageBordScreen(),
        '/message_bord_create': (context) => const MessageBordCreateScreen(),
        '/preview_message_bord': (context) => const PreviewMessageBordScreen(),
      },
    );
  }
}

class InitPage extends ConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(authProvider).checkLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            final isLoggedIn = snapshot.data ?? false;
            return isLoggedIn ? const TopScreen() : const LoginScreen();
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error has occured"),
            );
          } else {
            return const Text("something wrong pleas try again");
          }
        });
  }
}
