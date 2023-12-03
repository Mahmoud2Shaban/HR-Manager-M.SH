import 'package:flutter/material.dart';

import '../orders/request_vacation.dart';
import '../orders/vacation_history.dart';
import '../orders/view_vacation.dart';
import '../permissions/permission_history.dart';
import '../permissions/request_permission.dart';
import '../permissions/view_permission.dart';
import 'home_page.dart';
import 'login_page.dart';

class GenerateToken extends StatefulWidget {
  @override
  State<GenerateToken> createState() => _GenerateTokenState();
}

class _GenerateTokenState extends State<GenerateToken> {

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
        title: Center(child: Text("Generate Token",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300),),),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(onPressed: (){
          setState(() {
            scaffoldkey.currentState?.openDrawer();
          });
        },icon: Icon(Icons.menu),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 15,right: 15),
        height: 280,
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
              margin: EdgeInsets.only(top: 10,left: 25),
              alignment: Alignment.topLeft,
                child: Text("Code",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200),)),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 5,bottom: 10),
              padding: EdgeInsets.only(left: 15),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Container(

              height: 60,
              padding: EdgeInsets.only(left: 20,top: 7,right: 5),
              child: Text("Kindly note that this code is valid for 2 minutes only.",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            ),
            Divider(
              height:0.1,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 140,
              height: 40,
              child: MaterialButton(
                onPressed: (){},
                child: Text("Generate",
                  style: TextStyle(color: Colors.white,
                      fontSize: 18,),),
                elevation: 20,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
