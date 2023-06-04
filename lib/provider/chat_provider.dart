import 'package:chat_app/data/authHelper.dart';
import 'package:chat_app/data/chatHelper.dart';
import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/model/chat_user_model.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider() {
    getAllUser();
  }

  List<ChatUser> chatUser = [];
  TextEditingController messageContentController = TextEditingController();

  saveUser() async {}

  //ميثود رح اجيبها منها كل اليوزرات في التطبيق
  getAllUser() async {
    chatUser = await ChatHelper.chatHelper.getAllUser();
    notifyListeners();
  }

  sendMessage(String otherId) {
    ChatMessage message = ChatMessage(messageContentController.text,
        AuthHelper.authHelper.getCurrentUserId());
    ChatHelper.chatHelper.sendMessage(message, otherId);
  }
}
