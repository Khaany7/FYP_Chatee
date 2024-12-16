import 'package:chatee/features/auth/opt_screen.dart';
import 'package:chatee/features/auth/screens/login_screen.dart';
import 'package:chatee/features/auth/screens/user_information_screen.dart';
import 'package:chatee/common/widgets/error.dart';
import 'package:chatee/features/screens/select_contacts_screen.dart';
import 'package:chatee/features/Chat/screens/mobile_chat_screen.dart';
import 'package:chatee/screens/mobile_layout_screen.dart';
import 'package:chatee/screens/web_layout_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));

    case UserInformationScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserInformationScreen());
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContactsScreen());
    case MobileChatScreen.routeName:
    final arguments=settings.arguments as Map<String,dynamic>;
    final name=arguments['name'];
    final uid=arguments['uid'];
      return MaterialPageRoute(builder: (context) => MobileChatScreen(
        name: name,
        uid: uid,
      ));
    case '/mobile':
      return MaterialPageRoute(
          builder: (context) => const MobileLayoutScreen());

    case '/web':
      return MaterialPageRoute(builder: (context) => const WebLayoutScreen());
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
