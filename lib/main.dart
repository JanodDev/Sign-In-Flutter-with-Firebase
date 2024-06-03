import 'dart:io';

import 'package:firbase_tutorial/models/UserModel.dart';
import 'package:firbase_tutorial/services/auth.dart';
import 'package:firbase_tutorial/services/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: '',
          appId: '1:85858645667:android:0765adfa177912fd1bb116',
          messagingSenderId: '85858645667',
          projectId: 'firstfirebase-eedca',
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
