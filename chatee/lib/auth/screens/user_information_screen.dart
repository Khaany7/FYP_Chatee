import 'dart:io';
import 'package:chatee/auth/screens/repository/controller/auth_controller.dart';
import 'package:chatee/screens/mobile_layout_screen.dart';
import 'package:chatee/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {
      image = image;
    });
  }

  void storeUserData() async {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
            image,
          );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MobileLayoutScreen()),
      );
    } else {
      showSnackBar(context: context, content: 'Please enter your name');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                          ),
                          radius: 64,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 64,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: storeUserData,
                    icon: const Icon(
                      Icons.done,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:chatee/auth/screens/repository/controller/auth_controller.dart';
// import 'package:chatee/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UserInformationScreen extends ConsumerStatefulWidget {
//   static const String routeName = '/user-information';
//   const UserInformationScreen({super.key});

//   @override
//   ConsumerState<UserInformationScreen> createState() =>
//       _UserInformationScreenState();
// }

// class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
//   final TextEditingController nameController = TextEditingController();
//   File? image;
//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }

//   void selectImage() async {
//     image = await pickImageFromGallery(context);
//     setState(() {
//       image = image;
//     });
//   }

//   void storeUserData() async {
//     String name = nameController.text.trim();

//     if (name.isNotEmpty) {
//       ref.read(authControllerProvider).saveUserDataToFirebase(
//             context,
//             name,
//             image,
//           );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   image == null
//                       ? const CircleAvatar(
//                           backgroundImage: NetworkImage(
//                             'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
//                           ),
//                           radius: 64,
//                         )
//                       : CircleAvatar(
//                           backgroundImage: FileImage(image!),
//                           radius: 64,
//                         ),
//                   Positioned(
//                     bottom: -10,
//                     left: 80,
//                     child: IconButton(
//                       onPressed: selectImage,
//                       icon: const Icon(
//                         Icons.add_a_photo,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: size.width * 0.85,
//                     padding: const EdgeInsets.all(20),
//                     child: TextField(
//                       controller: nameController,
//                       decoration: const InputDecoration(
//                         hintText: 'Full Name',
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: storeUserData,
//                     icon: const Icon(
//                       Icons.done,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


