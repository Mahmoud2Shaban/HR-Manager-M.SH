import 'package:flutter/material.dart';
import 'package:hr/permissions/permission_history.dart';
import 'package:hr/permissions/request_permission.dart';

import '../orders/request_vacation.dart';
import '../orders/vacation_history.dart';
import '../orders/view_vacation.dart';
import '../pages/generate_token.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class ViewPermission extends StatefulWidget {
  @override
  State<ViewPermission> createState() => _ViewPermissionState();
}

class _ViewPermissionState extends State<ViewPermission> {

  final scaffoldkey = GlobalKey<ScaffoldState>();

  // variable list
  var selected;// show variable DropdownButton
  late String selectes = '';//variable DropdownButton

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
        title: Center(child: Text("View Permission Requests",
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
        height: 220,
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
              padding: EdgeInsets.only(top: 15,left: 20),
              child: Text("Request Status",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            ),
            // list sections
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),

                margin: EdgeInsets.only(top: 20,left: 23,right: 23),
                padding: EdgeInsets.all(5),
                child: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down,size: 30,color: Colors.deepOrangeAccent,),
                  isExpanded: true,
                  hint: Container(

                    child: Center(
                      child: Text("Select",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w300),),
                    ),
                  ),
                  style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w300),
                  //underline: Divider(thickness: 0.1,),

                  items: [
                    "Pending",
                    "Rejected",
                    "Cancelled",
                    "Final Acceptance",
                    "ConvertedToCommittee",].map((e) =>
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
            Container(
              margin: EdgeInsets.only(top: 5,left: 180),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),

              child: MaterialButton(
                onPressed: (){},
                child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),

            )
          ],
        ),

      ),
    );
  }
}
