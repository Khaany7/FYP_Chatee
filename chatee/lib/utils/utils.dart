import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// Future<File?> pickImageFromGallery(BuildContext context) async {
//   File? image;
//   try {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       image = File(pickedImage.path);
//     }
//   } catch (e) {
//     showSnackBar(context: context, content: e.toString());
//   }
//   return null;
// }

Future<File?> pickImageFromGallery(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return File(image.path);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No image selected'),
      ),
    );
    return null;
  }
}
