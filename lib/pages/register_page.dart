import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/utlis.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text editing controllers
  final fullnamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confrompasswordcontroller = TextEditingController();
  String gender="";    // variable male or female

  // show password
  bool pass = true;
  bool confpass = true;

  // variable list
  var selected;// show variable DropdownButton
  late String selectes = '';//variable DropdownButton

  //validate
  final mykey = GlobalKey<FormState>();
  // logo
  var selectedImage ;

  final _auth = FirebaseAuth.instance;    //firebase server
  bool isloading = false;   // variable progress

  //final databaseRef = FirebaseDatabase.instance.ref('UserData');

  // id
  String id = DateTime.now().microsecondsSinceEpoch.toString();


  // // error message to user
  // void showErrorMessage(String message){
  //   showDialog(
  //     context: context,
  //     builder: (context){
  //       return AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Text(
  //           message,
  //           style: TextStyle(color: Colors.white),),
  //       );
  //     },);
  // }


// RealTime Database
  // void signup() async{
  //   setState(() {
  //     isloading = true;
  //   });
  //   try{
  //
  //     if(mykey.currentState!.validate()){
  //       final newuser = await _auth.createUserWithEmailAndPassword(   //firebase create with email & password
  //           email: emailcontroller.text.trim(), password: passwordcontroller.text).then((value){
  //         databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
  //           "id :" :DateTime.now().microsecondsSinceEpoch.toString(),
  //           "Name :" :fullnamecontroller.text.toString(),
  //           "Phone Number :" :phonecontroller.text.toString(),
  //           "Email Address :" :emailcontroller.text.toString(),
  //           "Password :" :passwordcontroller.text.toString(),
  //           "Work Section :" :selected,
  //           "Gender :" :gender.toString(),
  //         }).then((value){
  //           Navigator.of(context).push(
  //               MaterialPageRoute(builder: (v){
  //                 return HomePage();
  //               })
  //           );
  //           Utlis().toastMessage("Data Added Successfully");
  //           setState(() {
  //             isloading = false;
  //           });
  //
  //         });
  //       });
  //
  //     }
  //
  //   }
  //   on FirebaseAuthException catch(e){
  //     // cancel progress
  //     setState(() {
  //       isloading = false;
  //     });
  //   }
  // }




  // Firebase
  void signup() async{
    setState(() {
      isloading = true;
    });
    try{
      //firebase create with email & password
      final newuser = await _auth.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(), password: passwordcontroller.text).then((value){
        var user = _auth.currentUser;
        // create table userData->uid
        FirebaseFirestore.instance.collection('UserData').doc(user!.uid).set({
          "id :" :id,
          "Name :" :fullnamecontroller.text.toString(),
          "Phone Number :" :phonecontroller.text.toString(),
          "Email Address :" :emailcontroller.text.toString(),
          "Password :" :passwordcontroller.text.toString(),
          "Work Section :" :selected,
          "Gender :" :gender.toString(),
        });
        // Check user Doctor or Patient
        if(value != null){
          if(selected == 'HR'){
            Utlis().toastMessage("Create Account Successfully");
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>HomePage()));
            setState(() {
              isloading = false;
            });

          }else if(selected == 'Doctor'){
            Utlis().toastMessage("Create Account Successfully");
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>HomePage()));
            setState(() {
              isloading = false;
            });
          }
        }

      } );
    }on FirebaseAuthException catch(e){
      setState(() {
        isloading = true;
      });
      Utlis().toastMessage(e.code);
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Form(
          key: mykey,
          child: Center(
          child: SafeArea(
          child: Center(
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

            // Full Name

            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:  TextFormField(
                    controller: fullnamecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:"Full Name" ,
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: Icon(Icons.person,color: Colors.deepOrangeAccent,),
                    ),
                    validator: (value){    //check validator
                      if(value!.length >=3){    // name than 3 letters are not accepted
                        return null;
                      }if(value .isEmpty){
                        return 'Please enter name';
                      }else{
                        return 'Enter valid value';
                      }
                    },
                  ),
                )),

            SizedBox(height: 10,),

            // Phone Number

            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: phonecontroller,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:"Phone Number" ,
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: Icon(Icons.phone,color: Colors.deepOrangeAccent,),
                    ),
                    validator: (value) {//check validator
                      if(value!.isEmpty){
                        return 'please enter phone_number ';
                      }if(value.length <11){   // less than 11 digits are not accepted
                        return "Please enter valid phone";
                      }else{
                        return null;
                      }
                    },
                  ),
                )),

            SizedBox(height: 10,),

            //  Email Address

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
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:"Email Address" ,
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: Icon(Icons.email,color: Colors.deepOrangeAccent,),
                    ),
                    validator: (value) {    //check validator
                      if(value!.isEmpty){
                        return 'Please enter email';
                      }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return "Please enter valid email";

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
                    keyboardType: TextInputType.number,
                    obscureText: pass,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:"Password" ,
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              pass = !pass;  //show password & hide password
                            });
                          },
                          icon: Icon(pass
                              ? Icons.visibility_off
                              : Icons.visibility,color: Colors.deepOrangeAccent,)),
                    ),
                    validator: (value) {//check validator
                      if(value!.isEmpty){
                        return 'Please enter password';
                      }if(value.length <6){    // less than 6 are not accepted
                        return 'The password is weak';
                      }else{
                        return null;
                      }
                    },
                  ),
                )),

            SizedBox(height: 10,),

            // Confirm Password
            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: confrompasswordcontroller,
                    keyboardType: TextInputType.number,
                    obscureText: confpass,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:"Confirm Password" ,
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confpass = !confpass;  //show password & hide password
                            });
                          },
                          icon: Icon(confpass
                              ? Icons.visibility_off
                              : Icons.visibility,color: Colors.deepOrangeAccent,)),
                    ),
                    validator: (value) {    //check validator
                      if(value!.isEmpty){
                        return 'Please enter password';
                      }if(passwordcontroller.text != confrompasswordcontroller.text){
                        return "Password Do not match";

                      }else{
                        return null;
                      }
                    },
                  ),
                )),

            SizedBox(height: 10,),

            // list sections

            Center(
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color:Colors.white,width:1)
                ),
                margin: EdgeInsets.symmetric(horizontal: 23),
                padding: EdgeInsets.all(5),

                child: DropdownButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.arrow_drop_down,size: 30,color: Colors.deepOrangeAccent,),
                  ),
                  isExpanded: true,
                  hint: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Select",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.w300),),
                  ),
                  style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w300),
                  underline: Divider(thickness: 0.1,),

                  items: [
                    "HR",
                    "Institute Agent",
                    "Secretary General",
                    "Head Department",
                    "Education Affairs",
                    "Assistant Professor",
                    "Doctor"].map((e) =>
                      DropdownMenuItem(child: Text("$e",),
                        value: e,
                      )).toList(),
                  onChanged: (val){//pass variable
                    setState(() {
                      selected=val;
                    });
                    setState(() {
                      selectes = val.toString();
                    });
                  },
                  value: selected,

                ),
              ),
            ),
            SizedBox(height: 10,),

            // Row(Radio(male || female))
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(value:"Male", groupValue: gender, onChanged: (val){
                    setState(() {
                      gender=val!;
                    });

                  }),
                  Text("Male",style: TextStyle(fontSize: 25,color: Colors.deepOrange),),
                  SizedBox(width: 55,),
                  Radio(value:"Female", groupValue: gender, onChanged: (val){
                    setState(() {
                      gender=val!;
                    });

                  }),
                  Text("Female",style: TextStyle(fontSize: 25,color: Colors.deepOrange),)
                ],
              ),
            ),

            SizedBox(height: 35,),

            //  Resgister Button

            Container(
                margin: EdgeInsets.only( bottom: 10, left: 15, right: 15),
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
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
                    if(mykey.currentState!.validate()){
                      signup();
                    }



                  //   setState(() {
                  //     isloading = true;
                  //   });
                  // try{
                  //
                  //   if(mykey.currentState!.validate()){
                  //     final newuser = await _auth.createUserWithEmailAndPassword(   //firebase create with email & password
                  //         email: emailcontroller.text.trim(), password: passwordcontroller.text).then((value){
                  //       databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                  //         "id :" :DateTime.now().microsecondsSinceEpoch.toString(),
                  //         "Name :" :fullnamecontroller.text.toString(),
                  //         "Phone Number :" :phonecontroller.text.toString(),
                  //         "Email Address :" :emailcontroller.text.toString(),
                  //         "Password :" :passwordcontroller.text.toString(),
                  //         "Work Section :" :selected,
                  //         "Gender :" :gender.toString(),
                  //       }).then((value){
                  //           Navigator.of(context).push(
                  //               MaterialPageRoute(builder: (v){
                  //                 return HomePage();
                  //               })
                  //           );
                  //           Utlis().toastMessage("Data Added Successfully");
                  //           setState(() {
                  //             isloading = false;
                  //           });
                  //
                  //       });
                  //     });
                  //
                  //   }
                  //
                  // }
                  // on FirebaseAuthException catch(e){
                  //   // cancel progress
                  //   setState(() {
                  //     isloading = false;
                  //   });
                  // }
                  },
                    /*databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                      "id :" :DateTime.now().microsecondsSinceEpoch.toString(),
                      "Name :" :fullnamecontroller.text.toString(),
                      "Phone Number :" :phonecontroller.text.toString(),
                      "Email Address :" :emailcontroller.text.toString(),
                      "Password :" :passwordcontroller.text.toString(),
                      "Work Section :" :selected,
                      "Gender :" :gender.toString(),
                    }).then((value) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return HomePage();
                          })
                      );
                      Utlis().toastMessage("Data Added Successfully");
                      setState(() {
                        isloading = false;
                      });
                    }).onError((error, stackTrace){
                      Utlis().toastMessage(error.toString());
                      setState(() {
                        isloading = false;
                      });
                    });

                  },*/


                    /*setState(() {
                      isloading = true;   //Show Progress
                    });
                    try{

                      if(mykey.currentState!.validate()){   // validate
                        final newuser = await _auth.createUserWithEmailAndPassword(   //firebase create with email & password
                            email: emailcontroller.text.trim(), password: passwordcontroller.text).then((value){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v){
                                return HomePage();
                              })
                          );
                            }
                         );
                      }
                    }on FirebaseAuthException catch(e){
                      // show error message
                      showErrorMessage(e.code);
                      // cancel progress
                      setState(() {
                        isloading = false;
                      });
                    }*/


                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (v){
                          return HomePage();
                        })
                    );*/
                  //},
                  child: isloading? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Loading...",style: TextStyle(fontSize: 20,),),
                      SizedBox(width: 10,),
                      CircularProgressIndicator(color: Colors.white,),
                    ],
                  ): Text("Resgister",
                    style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,),
                  ),
                  splashColor: Colors.red,  // change color when pressed
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                )),

            SizedBox(height: 50,),

            // Login now

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account?',
                    style: TextStyle(color: Colors.grey[700]),),
                  SizedBox(width: 4,),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                      child: Text('Login Now',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ))),
                ],
              ),
            ),


          ])
          ))
          )),
        )
    );
  }
}
