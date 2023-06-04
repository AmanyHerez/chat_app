class ChatUser{
  String? email;
  String? id;

  ChatUser.fromJson(Map<String,dynamic> map){
    email=map['email'];
    id=map['id'];
  }
}