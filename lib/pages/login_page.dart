import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr/pages/register_page.dart';
import 'package:hr/utils/utlis.dart';

import '../home_hr.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text editing controllers
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // show password

  bool pass = true;

  var selectedImage ;

  final formkey = GlobalKey<FormState>();     //validate


  final _auth = FirebaseAuth.instance;   //firebase server
  bool isloading=false;    // show progress

  // // error message to user
  // void showErrorMessage(String message){
  //   showDialog(
  //     context: context,
  //     builder: (context){
  //       return AlertDialog( // Message
  //         backgroundColor: Colors.deepOrange,  // background message
  //         title: Text(
  //           message,
  //           style: TextStyle(color: Colors.white),),
  //       );
  //     },);
  // }

  // RealTime Database
  // void sigin()async{
  //   setState(() {
  //     isloading = true;     //Show Progress
  //   });
  //   try {
  //     if (formkey.currentState!.validate()) {    //validate
  //       final user = await _auth.signInWithEmailAndPassword(   // firebase signin with email & password
  //           email: emailcontroller.text.trim(),   // pass email
  //           password: passwordcontroller.text.trim());   // pass password
  //       if (user != null) {
  //         Navigator.of(context).push(
  //             MaterialPageRoute(builder: (v) {
  //               return HomePage();
  //             })
  //         );
  //         Future.delayed(Duration(seconds: 2), () {  //time show progress
  //           setState(() {
  //             ScaffoldMessenger.of(context)
  //                 .showSnackBar(const SnackBar(  // show message correct data
  //               padding: EdgeInsets.only(left: 25, bottom: 5),
  //               content: Text('Correct data', style: TextStyle(fontSize: 15,
  //                   fontWeight: FontWeight.w600),),
  //               duration: Duration(seconds: 2),    // Display time message
  //               backgroundColor: Colors.deepOrange,  // background message
  //             ));
  //             isloading = false;   // cancel progress
  //             emailcontroller.clear();       // clear Email
  //             passwordcontroller.clear();   // clear password
  //           });
  //         });
  //       }
  //     }
  //
  //   } on FirebaseAuthException catch(e){
  //     // show error message
  //     //showErrorMessage(e.code);
  //     // cancel progress
  //     setState(() {
  //       isloading = false;
  //     });
  //   }
  // }

  //Function Check user Doctor or Patient
  void route(){
    setState(() {
      isloading = true;
    });
    try{
      User? user = FirebaseAuth.instance.currentUser;
      var kk = FirebaseFirestore.instance.collection("UserData")
          .doc(user!.uid).get()
          .then((DocumentSnapshot documentSnapshot) {
        if(documentSnapshot.exists){
          if(documentSnapshot.get("Work Section :") == 'Doctor'){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>HomePage()));
            setState(() {
              isloading = false;
            });
          }else{
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>HomePage()));
            setState(() {
              isloading = false;
            });
          }
        }
      });
    }catch(error){
      debugPrint(error.toString());
      Utlis().toastMessage(error.toString());
      setState(() {
        isloading = false;
      });
    }

  }
  // Function Login in Firebase Database
  void login(){
    setState(() {
      isloading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.toString()).then((value){
      Utlis().toastMessage(value.user!.email.toString());
      route();
      setState(() {
        isloading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utlis().toastMessage(error.toString());
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: Center(
            child: SafeArea(
                child: Center(
                    child: Form(
                      key: formkey,   // key = variable validate
                      child: SingleChildScrollView(
                          child: Column(
                            children: [

                              // Image Obour

                              Container(

                                margin: EdgeInsets.only(right: 5,left: 5,bottom: 50),
                                height: 200,
                                width: double.infinity,
                                child: CircleAvatar(
                                 backgroundColor: Colors.grey[300],
                                  //radius: 20.0,

                                   child: ClipOval(
                                     child: selectedImage != null ? Image.file(
                                       selectedImage!,
                                       fit: BoxFit.cover,

                                     ):Image.asset("images/removebg.png"),
                                   ),

                                ),
                              ),

                              // Phone Number

                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: TextFormField(
                                    controller: emailcontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrange),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      labelText:"Email" ,
                                      labelStyle: TextStyle(color: Colors.grey[500]),
                                      suffixIcon: Icon(Icons.email,color: Colors.deepOrangeAccent,),
                                    ),
                                    validator: (value) {   //check validator
                                      if(value!.isEmpty){
                                        return 'Enter Email please';
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                )),

                              SizedBox(height: 10,),

                              // Password

                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: TextFormField(
                                      controller: passwordcontroller,
                                      obscureText: pass,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepOrange),
                                        ),
                                        fillColor: Colors.grey.shade200,
                                        filled: true,
                                        labelText:"Password" ,
                                        labelStyle: TextStyle(color: Colors.grey[500]),
                                        suffixIcon:IconButton(
                                            onPressed: () {
                                              setState(() {
                                                pass = !pass;  //show password & hide password
                                              });
                                            },
                                            icon: Icon(pass
                                                ? Icons.visibility_off
                                                : Icons.visibility,color: Colors.deepOrangeAccent,)),
                                      ),
                                      validator: (value){     //check validator
                                        if(value!.isEmpty){
                                          return'Password is Empty';
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                  )),

                              SizedBox(height: 35,),

                              //  Login Button

                              Container(
                                margin: EdgeInsets.only( bottom: 10, left: 15, right: 15),
                                width: 340,
                                height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.redAccent,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(4,4),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: Offset(-4,-4),

                                        ),
                                      ]
                                  ),
                                child: MaterialButton(
                                  onPressed: () async{
                                    if (formkey.currentState!.validate()){
                                      login();
                                    }

                                    // setState(() {
                                    //   isloading = true;     //Show Progress
                                    // });
                                    // try {
                                    //   if (formkey.currentState!.validate()) {    //validate
                                    //     final user = await _auth.signInWithEmailAndPassword(   // firebase signin with email & password
                                    //         email: emailcontroller.text.trim(),   // pass email
                                    //         password: passwordcontroller.text.trim());   // pass password
                                    //     if (user != null) {
                                    //       Navigator.of(context).push(
                                    //           MaterialPageRoute(builder: (v) {
                                    //             return HomePage();
                                    //           })
                                    //       );
                                    //       Future.delayed(Duration(seconds: 2), () {  //time show progress
                                    //         setState(() {
                                    //           ScaffoldMessenger.of(context)
                                    //               .showSnackBar(const SnackBar(  // show message correct data
                                    //             padding: EdgeInsets.only(left: 25, bottom: 5),
                                    //             content: Text('Correct data', style: TextStyle(fontSize: 15,
                                    //                 fontWeight: FontWeight.w600),),
                                    //             duration: Duration(seconds: 2),    // Display time message
                                    //             backgroundColor: Colors.deepOrange,  // background message
                                    //           ));
                                    //           isloading = false;   // cancel progress
                                    //           emailcontroller.clear();       // clear Email
                                    //           passwordcontroller.clear();   // clear password
                                    //         });
                                    //       });
                                    //     }
                                    //   }
                                    //
                                    // } on FirebaseAuthException catch(e){
                                    //   // show error message
                                    //   showErrorMessage(e.code);
                                    //   // cancel progress
                                    //   setState(() {
                                    //     isloading = false;
                                    //   });
                                    // }
                                  },
                                  child:isloading
                                  ? Row(  //show text ("loading") && progress
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Loading...", style: TextStyle(fontSize: 20,),),

                                    SizedBox(width: 10,),

                                    CircularProgressIndicator(
                                      color: Colors.white,),
                                  ],
                                ) : Text("Login",
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,),
                                  ),
                                  splashColor: Colors.red,  // change color when pressed
                                  color: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                ),
                              )),

                              SizedBox(height: 80,),

                              // Register now

                              Container(
                                margin: EdgeInsets.only(top: 70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Not a member?',
                                      style: TextStyle(color: Colors.grey[700]),),
                                    SizedBox(width: 4,),
                                    TextButton(onPressed: (){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (v){
                                            return RegisterPage();
                                          })
                                      );
                                    },
                                        child: Text('Ragister now',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  ],
                                ),
                              )

                            ],
                          )
                      ),
                    )
                )
            )
        )
    );
  }
}
