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
          //SizedBox(height: h*0.1,),
          CustomListItem(
            name: "Paste",
            expiry: "2021-04-14",
            addedOn: "2021-04-09",
            thumbnail:Image.asset("images/female.png") ,
          )
        ],
      )
    );
  }
}
