import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/pages/home_page.dart';
import 'package:hr/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashServices{

  //Function Check user Doctor or Patient
  void route(BuildContext context){
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance.collection("UserData")
        .doc(user!.uid).get()
        .then((DocumentSnapshot documentSnapshot) {
      if(documentSnapshot.exists){
        if(documentSnapshot.get("Work Section :") == 'Doctor'){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomePage()));
        }else{
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomePage()));
        }
      }
    });
  }

  // Function open the program after the time(Second(3),LoginScreen)
  void isLogin(BuildContext context){

    // firebas auth
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    // Confirm whether the user is login or logout
    if(user != null){

      // check user save use Doctor or Patient
      route(context);

      // Timer(const Duration(seconds: 3),
      //         ()=>Navigator.push(context,
      //         MaterialPageRoute(builder:(context)=>DoctorPage())));
    }else{
      Timer(const Duration(seconds: 3),
              ()=>Navigator.push(context,
              MaterialPageRoute(builder:(context)=>LoginPage())));
    }


  }
}