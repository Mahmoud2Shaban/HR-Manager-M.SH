import 'package:flutter/material.dart';
import 'package:hr/pages/frist_page.dart';
import 'package:hr/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized(); // firebase
  await Firebase.initializeApp(); //firebase


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      //home: LoginPage(),

    )
  );
}