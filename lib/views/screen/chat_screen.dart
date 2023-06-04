import 'package:chat_app/data/chatHelper.dart';
import 'package:chat_app/model/chat_user_model.dart';
import 'package:chat_app/provider/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:provider/provider.dart';

import '../../model/chat_message_model.dart';

class ChatScreen extends StatelessWidget {
  ChatUser otherUser;

  ChatScreen(this.otherUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(otherUser.email ?? ' '),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(child: StreamBuilder<List<ChatMessage>>(
                stream: ChatHelper.chatHelper.getAllChatMessage(otherUser.id!),
                builder: (context, snapshot) {
                  // List<QueryDocumentSnapshot<Map<String, dynamic>>> list= snapshot.data!.docs;
                return ListView.builder(
                  //itemCount: list.length,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      clipper: ChatBubbleClipper1(type: snapshot.data![index].isFromMe?BubbleType.sendBubble:BubbleType.receiverBubble),
                      backGroundColor: Color(0xffE7E7ED),
                      alignment: snapshot.data![index].isFromMe?Alignment.topRight:Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          snapshot.data![index].content,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    return  ChatBubble(
                      clipper: ChatBubbleClipper1(type: snapshot.data![index].isFromMe?BubbleType.sendBubble:BubbleType.receiverBubble),
                      alignment: snapshot.data![index].isFromMe?Alignment.topRight:Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Colors.blue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(snapshot.data![index].content
                        ,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  // return Text(snapshot.data![index].content);
                  // return Text(list[index].data()['content'].toString());
                },);
              },)),
              Row(

                children: [
                  Expanded(
                    child: TextField(
                      controller: provider.messageContentController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: (){
                        provider.sendMessage(otherUser.id!);
                      },
                        child: Icon(Icons.send)),
                  )
                ],
              )
            ],
          );
        },

      ),
    );
  }
}
