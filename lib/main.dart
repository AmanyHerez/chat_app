import 'package:chat_app/animation.dart';
import 'package:chat_app/provider/auth_provider.dart';
import 'package:chat_app/provider/chat_provider.dart';
import 'package:chat_app/router/router.dart';
import 'package:chat_app/views/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BNB/layer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ChatProvider(),)

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navKey,

        home: SplachScreen(),
      ),
    );
  }
}
