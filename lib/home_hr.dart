
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hr/pages/login_page.dart';

class HomeHr extends StatefulWidget {
  @override
  State<HomeHr> createState() => _HomeHrState();
}

class _HomeHrState extends State<HomeHr> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.deepOrangeAccent,
        color: Colors.deepOrange,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.date_range,color: Colors.white,),
          Icon(Icons.bookmark,color: Colors.white,),
          Icon(Icons.settings,color: Colors.white,),


        ],
      ),

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("Home",style: TextStyle(color:Colors.white),)),
        leading: IconButton(onPressed: (){
          setState(() {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (v){
                  return LoginPage();
                })
            );
          });
        },icon: Icon(Icons.logout),),
      ),


    );
  }
}
