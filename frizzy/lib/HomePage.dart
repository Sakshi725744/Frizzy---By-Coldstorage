import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frizzy/foodTile.dart';
import 'package:frizzy/heading.dart';
import 'package:frizzy/sizeconfig.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = SizeConfig.safeBlockVertical * 100;
    double w = SizeConfig.safeBlockHorizontal * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w*0.05,vertical: h*0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingGradient(),
                IconButton(icon: Icon(Icons.home,color:Theme.of(context).primaryColor,),iconSize: 40,onPressed: (){FirebaseAuth.instance.signOut();},)
              ],
            ),
          ),
          Expanded(
            streamFirebase(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                
                  child: Text(
                    "On pressing the Camera/Barcode button \n live data of the food with expiry \n will be sent to the app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                 
                
              ),
            )

        ],
      )
    );
  }
}
