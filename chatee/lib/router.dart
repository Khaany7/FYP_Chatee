import 'package:chatee/features/auth/opt_screen.dart';
import 'package:chatee/features/auth/screens/login_screen.dart';
import 'package:chatee/features/auth/screens/user_information_screen.dart';
import 'package:chatee/common/widgets/error.dart';
import 'package:chatee/screens/mobile_layout_screen.dart';
import 'package:chatee/screens/web_layout_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case OTPScreen.routeName:
    final verificationId=settings.arguments as String;
      return MaterialPageRoute(builder: (_) => OTPScreen(
        verificationId: verificationId,
      ));

      case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (_) => const UserInformationScreen(

      ));
    case '/mobile':
      return MaterialPageRoute(builder: (_) => const MobileLayoutScreen());
    case '/web':
      return MaterialPageRoute(builder: (_) => const WebLayoutScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: ErrorScreen(
            error: 'This page does not exist ${settings.name}',
          ),
        ),
      );
  }
}
