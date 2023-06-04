import 'package:chat_app/data/authHelper.dart';
import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/model/chat_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHelper {
  ChatHelper._();

  static ChatHelper chatHelper = ChatHelper._();
  CollectionReference<Map<String, dynamic>> userFirebaseFirestore =
      FirebaseFirestore.instance.collection('users');

  saveUser(String email, String id) async {
    userFirebaseFirestore.doc(id).set({"email": email, "id": id});
  }


  Future<List<ChatUser>> getAllUser() async {
    QuerySnapshot<Map<String, dynamic>> result =
        await userFirebaseFirestore.get();
    List<ChatUser> users =
        await result.docs.map((e) => ChatUser.fromJson(e.data())).toList();
    users.removeWhere(
        (element) => element.id == AuthHelper.authHelper.getCurrentUserId());

    return users;
  }

  String getChatId(String otherUserId) {
    String myId = AuthHelper.authHelper.getCurrentUserId();
    int myHashCode = myId.hashCode;
    int otherHashCode = otherUserId.hashCode;
    String CollectionId =
        myHashCode > otherHashCode ? '$otherUserId$myId' : "$myId$otherUserId";
    return CollectionId;
  }

  sendMessage(ChatMessage message, String otherUserId) async {
    String CollectionId = getChatId(otherUserId);
    // هيك ضفت الرسالة الى بدو اياها
    FirebaseFirestore.instance
        .collection('chats')
        .doc(CollectionId)
        .collection('messages')
        .add(message.toMap());
  }

  Stream<List<ChatMessage>> getAllChatMessage(
      String otherUserId) {
    String CollectionId = getChatId(otherUserId);
    // انا هان بالتطبيق تاعي ما بتعامل مع كوري سناب شوت انما مع شات مسج

    //كل مرة بيجي كوري سناب شوت خدو و حولو ل obj من نوع شات مسج
    // بحول عن طريق دالة ال map
//
// بتلف على كل عنصر داخل الستريم و خود ال  docs تعتو وروح حولهم من كويري سناب شوت الى لست من نوع شات مسج ورجعلي اياه بالاوبجيكت تاعه
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection('chats')
        .doc(CollectionId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
    return stream.map((event) {
      List<ChatMessage> message= event.docs.map((e) {
        ChatMessage chatMessage=ChatMessage.fromJson(e.data());
        return chatMessage;
      }).toList();
      return message;
    }
    );
  }
}
