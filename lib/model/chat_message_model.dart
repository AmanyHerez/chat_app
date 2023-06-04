import 'package:chat_app/data/authHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
 late String content;
 late String SenderId;
 late bool isFromMe;

 ChatMessage(this.content, this.SenderId);
 ChatMessage.fromJson(Map<String,dynamic> map){
   content= map['content'];
   SenderId=map['SenderId'];
   isFromMe=map['SenderId']==AuthHelper.authHelper.getCurrentUserId();
   // اذا تساوى بكون انا الباعتة
 }
toMap(){
  return {
    'time': FieldValue.serverTimestamp(),
    'content':content,
    'SenderId':SenderId,
  };
}
}