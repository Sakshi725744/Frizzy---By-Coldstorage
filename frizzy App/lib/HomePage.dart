import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frizzy/heading.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headingGradient(),
          Container(
            child: RaisedButton(
              child: Text("Logout"),
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
            ),

          ),
        ],
      ),
    );
  }
}
