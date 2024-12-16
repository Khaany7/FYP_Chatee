import 'package:chatee/common/utils/utils.dart';
import 'package:chatee/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({
    required this.auth,
    required this.firestore,
  });
  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String reciverUserId,
    required UserModel senderUsesr,
  }) async {
//users -> sender-id -> receiever id -> messages -> message id -> store message
    try {
      var timeSent = DateTime.now();
      UserModel receiverUserData;

      var userDataMap =
          await firestore.collection('users').doc(reciverUserId).get();
      receiverUserData = UserModel.fromMap(userDataMap.data()!);
      //users-> reciever user id => chats -> currnt user id -> set data
      
    } catch (e) {
      showSnackBar(context: context, content: e.asString());
    }
  }
}
