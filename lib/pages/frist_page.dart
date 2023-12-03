import 'package:flutter/material.dart';
import 'package:hr/firebase_services/splash_services.dart';



class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

// variable pass splashServices
  SplashServices splashScreen = SplashServices();


  void initState() {
    super.initState();
    // pass splashServices
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,

          decoration: BoxDecoration(  // image
            image: DecorationImage(image: AssetImage("images/removebg.png"),
                fit: BoxFit.contain

            ),
          ),


        ),
      ),
    );
  }
}
