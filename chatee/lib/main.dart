import 'package:chatee/features/auth/screens/repository/controller/auth_controller.dart';
import 'package:chatee/colors.dart';
import 'package:chatee/common/widgets/Loader.dart';
import 'package:chatee/common/widgets/error.dart';
import 'package:chatee/firebase_options.dart';
import 'package:chatee/router.dart';
import 'package:chatee/screens/mobile_layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatee',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: backgroundColor,
            elevation: 0,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                // return const LandingScreen();
                return const MobileLayoutScreen();
              } else {
                return const MobileLayoutScreen();
              }
            },
            loading: () => const Loader(),
            error: (error, trace) {
              return ErrorScreen(
                error: error.toString(),
              );
            },
          ),
    );
  }
}
