import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr/orders/vacation_history.dart';
import 'package:hr/orders/view_vacation.dart';
import 'package:hr/utils/utlis.dart';

import '../pages/generate_token.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../permissions/permission_history.dart';
import '../permissions/request_permission.dart';
import '../permissions/view_permission.dart';
import 'package:intl/intl.dart';

class RequestVacation extends StatefulWidget {
  @override
  State<RequestVacation> createState() => _RequestVacationState();
}

class _RequestVacationState extends State<RequestVacation> {

  final scaffoldkey = GlobalKey<ScaffoldState>();

  DateTime dateTime=DateTime.now();
  DateTime dateTimes=DateTime.now();

  // variable TextForm
  TextEditingController vacation_from = TextEditingController();
  TextEditingController vacation_to = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController reason = TextEditingController();

  final _auth = FirebaseAuth.instance;    //firebase server
  bool isloading = false;   // variable progress

  final databaseRef = FirebaseDatabase.instance.ref('RequestVacation');

  // variable list
  var selected;// show variable DropdownButton
  late String selectes = '';//variable DropdownButton

  // function save patient data& show message error & show progress when click button
  void savedata(){
    setState(() {
      isloading = true;
    });

    databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
      "id" :DateTime.now().microsecondsSinceEpoch.toString(),
      "Vacation Type" :selected.toString(),
      "Vacation From" :vacation_from.text.toString(),
      "Vacation To" :vacation_to.text.toString(),
      "Days Count" :days.text.toString(),
      "Reason" :reason.text.toString(),
    }).then((value){
      setState(() {
        Utlis().toastMessage("Data saved successfully");
        isloading = false;
        vacation_from.clear();
        vacation_to.clear();
        days.clear();
        reason.clear();

      });
    }).onError((error, stackTrace){
      Utlis().toastMessage(error.toString());
      setState(() {
        isloading = false;
        vacation_from.clear();
        vacation_to.clear();
        days.clear();
        reason.clear();
      });
    });
  }


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
        title: Center(child: Text("Request Vacation",
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
              margin: EdgeInsets.only(top: 20,right: 15,left: 15),
              height: 300,
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
                    child: Text("Annual Credit",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.only(top: 8,left: 25,right: 25),
                    padding: EdgeInsets.only(top: 8,left:15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text("Remaining Dayes",style: TextStyle(fontSize: 17,color: Colors.grey[800],),),
                            ),
                            Container(
                              child: Text("(المتبقي من الرصيد السنوي)",style: TextStyle(fontSize: 16,color: Colors.grey[700],),),
                            )
                          ],
                        ),
                        Container(
                          child:Text("28",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Divider(
                      height:0.1,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.only(left: 25,right: 25),
                    padding: EdgeInsets.only(top: 8,left:15,right: 15,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Excuses Taken From Annual\n Balance",
                            style: TextStyle(fontSize: 17,color: Colors.grey[800],),),
                        ),
                        Container(
                          child:Text("0",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Divider(
                      height:0.1,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 33,
                    margin: EdgeInsets.only(left: 25,right: 25),
                    padding: EdgeInsets.only(top: 8,left:15,right: 15,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("Taken Annual",style: TextStyle(fontSize: 17,color: Colors.grey[800],),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              child: Text("(رصيد الاعتيادية)",style: TextStyle(fontSize: 15,color: Colors.grey[700],),),
                            )
                          ],
                        ),
                        Container(
                          child:Text("0/22",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Divider(
                      height:0.1,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 33,
                    margin: EdgeInsets.only(left: 25,right: 25),
                    padding: EdgeInsets.only(top: 8,left:15,right: 15,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("Taken Casual",style: TextStyle(fontSize: 17,color: Colors.grey[800],),
                              )),
                            SizedBox(width: 5,),
                            Container(
                              child: Text("(رصيد العارضة)",style: TextStyle(fontSize: 15,color: Colors.grey[700]),
                            ))
                          ],
                        ),
                        Container(
                          child:Text("0/6",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Divider(
                      height:0.1,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 33,
                    margin: EdgeInsets.only(left: 25,right: 25),
                    padding: EdgeInsets.only(top: 8,left:15,right: 15,bottom: 5),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("Taken Posted",style: TextStyle(fontSize: 17,color: Colors.grey[800]),),
                            ),
                            SizedBox(width: 5,),

                            Container(
                              child: Text("(الرصيد المرحل)",style: TextStyle(fontSize: 15,color: Colors.grey[700]),),
                            )
                          ],
                        ),
                        Container(
                          child:Text("0/0",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Divider(
                      height:0.1,
                      thickness: 2,
                    ),
                  ),


                ],
              ),
            ),

            //SizedBox(height: 40,),

            Container(
              margin: EdgeInsets.only(top: 30,right: 15,left: 15,bottom: 10),
              width: double.infinity,
              height: 500,
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
                    margin: EdgeInsets.only(left: 15,top: 10,right: 15),
                    alignment: Alignment.topLeft,
                    child: Text("Vacation Type",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),

                  // list sections
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15,left: 15,right: 15),
                      height: 50,
                      padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 10),

                      child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down,size: 30,color: Colors.deepOrangeAccent,),
                        isExpanded: true,
                        hint: Container(

                          child: Text("Select",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20,
                                fontWeight: FontWeight.w300),),
                        ),
                        style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w300),
                        //underline: Divider(thickness: 0.1,),

                        items: [
                          "أجازة سنوية",
                          "أجازة بالخصم",
                          "مامورية",
                          "مرضي",
                          "نصف العام",].map((e) =>
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
                    margin: EdgeInsets.only(left: 15,top: 2,right: 15),
                    alignment: Alignment.topLeft,
                    child: Text("Vacation From",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  Container(

                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5,left: 15,right: 15),
                    child: TextField(
                      controller: vacation_from,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            showDatePicker(context: context,  // click icon show date
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now(),).then((value) {
                              setState(() {
                                dateTime=value!;
                                final DateFormat formatter = DateFormat("dd/MM/yyyy");   // show data in textfromfield
                                final String formatted = formatter.format(value);
                                vacation_from.text=formatted;

                              });
                            });
                          });
                        },icon: Icon(Icons.date_range,color: Colors.deepOrange,),),

                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15,top: 8,right: 15),
                    alignment: Alignment.topLeft,
                    child: Text("Vacation to",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5,left: 15,right: 15),
                    child: TextField(
                      controller: vacation_to,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            showDatePicker(context: context,  // click icon show date
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2060),).then((value) {
                              setState(() {
                                dateTime=value!;
                                final DateFormat formatter = DateFormat("dd/MM/yyyy");   // show data in textfromfield
                                final String formatted = formatter.format(value);
                                vacation_to.text=formatted;

                              });
                            });
                          });
                        },icon: Icon(Icons.date_range,color: Colors.deepOrange,),),

                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15,top: 8,right: 15),
                    alignment: Alignment.topLeft,
                    child: Text("Days Count",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5,left: 15,right: 15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: days,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15,top: 8,right: 15),
                    alignment: Alignment.topLeft,
                    child: Text("Reason",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5,left: 15,right: 15),
                    child: TextField(
                      controller: reason,
                      decoration: InputDecoration(
                        hintText: "Please Enter Reason...",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 15,right: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: MaterialButton(
                      //padding: EdgeInsets.only(right: 55),
                      onPressed: (){
                        savedata();
                      },
                      child: Text("Add Request",style: TextStyle(color: Colors.white,fontSize: 18),),
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
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
