import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  try {
    if (ScaffoldMessenger.maybeOf(context) != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
          // duration: const Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    // Ignore the error
  }
}
// import 'package:flutter/material.dart';

// void showSnackBar({required BuildContext context, required String content}) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(content),
//       // duration: const Duration(seconds: 2),
//     ),
//   );
// }
