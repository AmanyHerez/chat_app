import 'package:chat_app/data/authHelper.dart';
import 'package:chat_app/provider/chat_provider.dart';
import 'package:chat_app/router/router.dart';
import 'package:chat_app/views/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/chat_user_model.dart';
import '../../provider/auth_provider.dart';
class UsersScreen extends StatelessWidget {

  ChatUser? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AuthHelper.authHelper.getCurrentUserId()),
      actions: [
        IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).SignOut();
    }, icon: Icon(Icons.logout))
      ]),
      body:Consumer<ChatProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          child: ListView.builder(
            itemCount: provider.chatUser.length,
            itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(ChatScreen(provider.chatUser[index]));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(bottom: 4,top: 4),
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Row(children: [
                  CircleAvatar(child: Text(provider.chatUser[index].email![0].toUpperCase()),),
                  SizedBox(width: 10,),
                  Text(provider.chatUser[index].email!),

                ],),
              ),
            );
          },),
        );
      },)

    );
  }
}
