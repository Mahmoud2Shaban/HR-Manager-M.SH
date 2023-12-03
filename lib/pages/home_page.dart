import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/utils/utlis.dart';
import '../orders/request_vacation.dart';
import '../orders/vacation_history.dart';
import '../orders/view_vacation.dart';
import '../permissions/permission_history.dart';
import '../permissions/request_permission.dart';
import '../permissions/view_permission.dart';
import 'generate_token.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scaffoldkey = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;   //firebase

  // RealTime Database
  // late User signedInUser;           //variable check user from firebase
  // final user = FirebaseAuth.instance.currentUser!;  // firebase server
  //
  // void initState(){
  //   super.initState();
  //   getCurrentUser();    // function check user from firebase
  // }
  //
  // void getCurrentUser(){     // function check user from firebase
  //
  //   try{
  //     final user = _auth.currentUser;
  //     if(user != null){
  //       signedInUser = user;
  //       print(signedInUser.email);
  //     }else{
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (v){
  //         return LoginPage();
  //       })
  //       );
  //     }}catch(e){
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(

              height: 56,
              decoration: BoxDecoration(
                color: Colors.deepOrange
              ),
              child: Center(child: Text("Menu",style: TextStyle(color: Colors.white),),),

            ),
            Padding(padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(title: Text('Home',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                leading: Icon(Icons.home,color:Colors.deepOrange),
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.deepOrange,),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v){
                        return HomePage();
                      })
                  );
                },
              ),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Padding(padding: const EdgeInsets.only(top: 8.0),
              child: ExpansionTile(
                title:Text('Vercation',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                leading: Icon(Icons.calendar_today_sharp,color:Colors.deepOrange),
                childrenPadding: EdgeInsets.only(left: 10),
                children: [
                  ListTile(
                    title: Text("Request Vacation",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.add_circle_sharp),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return RequestVacation();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("View Vacation Requests",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.layers),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return ViewVacation();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Vacation History",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.bar_chart_sharp),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return VacationHistory();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                ],

              ),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Padding(padding: const EdgeInsets.only(top: 8.0),

              child: ExpansionTile(
                title:Text('Permission',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                leading: Icon(Icons.access_time_outlined,color:Colors.deepOrange),
                childrenPadding: EdgeInsets.only(left: 10),
                children: [
                  ListTile(
                    title: Text("Request Permission",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.add_circle_sharp),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return RequestPermission();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("View Permission Requests",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.layers),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return ViewPermission();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Permission History",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    leading: Icon(Icons.bar_chart_sharp),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return PermissionHistory();
                          })
                      );
                    },
                  ),
                  Divider(
                    height:0.1,
                    thickness: 2,
                  ),
                ],

              ),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Padding(padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(title: Text('Generate Token',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                leading: Icon(Icons.vpn_key_rounded,color:Colors.deepOrange),
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.deepOrange,),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v){
                        return GenerateToken();
                      })
                  );
                },
              ),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Padding(padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(title: Text('Log out',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                leading: Icon(Icons.login_outlined,color:Colors.deepOrange),
                onTap: (){
                  // logout in firebase
                  _auth.signOut().then((value){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginPage()));
                  }).onError((error, stackTrace) {
                    // message error
                    Utlis().toastMessage(error.toString(),);
                  });
                },
              ),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("Home",style: TextStyle(color:Colors.white),)),
        leading: IconButton(onPressed: (){
          setState(() {
            scaffoldkey.currentState?.openDrawer();
          });
        },icon: Icon(Icons.menu),),
        actions: [
          IconButton(onPressed: (){
            // logout in firebase
            _auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LoginPage()));
            }).onError((error, stackTrace) {
              // message error
              Utlis().toastMessage(error.toString(),);
            });
          }, icon:Icon(Icons.login_outlined))
        ],

      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4,2),
                  ),
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-4,-4),

                  ),
                ]
            ),

            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(right: 15,left: 15,top: 20),
            child: Center(child: Text("Welcome to HR Mobile",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4,2),
                  ),
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-4,-4),

                  ),
                ]
            ),

            width: double.infinity,
            height: 140,
            margin: EdgeInsets.only(right: 15,left: 15,top: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child:Center(child: Text("Doctor Name",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child:Center(child: Text("قسم العمل",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child:Center(child: Text("معهد العبور العالي للإدارة\n و الحاسبات ونظم المعلومات",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                ),
              ],
            )

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4,2),
                  ),
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-4,-4),

                  ),
                ]
            ),

            width: double.infinity,
            height: 140,
            margin: EdgeInsets.only(right: 15,left: 15,top: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Remaining",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Text("28",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Taken Annual",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Text("0/22",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Taken Casual",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Text("0/6",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
