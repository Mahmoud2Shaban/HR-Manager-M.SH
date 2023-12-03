import 'package:flutter/material.dart';
import 'package:hr/orders/request_vacation.dart';
import 'package:hr/orders/view_vacation.dart';

import '../pages/generate_token.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../permissions/permission_history.dart';
import '../permissions/request_permission.dart';
import '../permissions/view_permission.dart';

class VacationHistory extends StatefulWidget {
  @override
  State<VacationHistory> createState() => _VacationHistoryState();
}

class _VacationHistoryState extends State<VacationHistory> {

  final scaffoldkey = GlobalKey<ScaffoldState>();

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
                leading: Icon(Icons.logout,color:Colors.deepOrange),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v){
                        return LoginPage();
                      })
                  );
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
        title: Center(child: Text("Vacation History",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300),),),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(onPressed: (){
          setState(() {
            scaffoldkey.currentState?.openDrawer();
          });
        },icon: Icon(Icons.menu),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
        margin: EdgeInsets.only(top: 30,left: 15,right: 15),
        height: 100,
        width: double.infinity,
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
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(top: 8,left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("(1)",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Text(" ماموريه",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),

        ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 15,right: 15),
              height: 100,
              width: double.infinity,
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
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(top: 8,left: 30,right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("(1)",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Text("أجازة بدل يوم",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 15,right: 15),
              height: 100,
              width: double.infinity,
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
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(top: 8,left: 30,right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("(1)",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Text(" نصف العام",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
