import 'package:flutter/material.dart';

class streamFirebase extends StatefulWidget {
  @override
  _streamFirebaseState createState() => _streamFirebaseState();
}

class _streamFirebaseState extends State<streamFirebase> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("food").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];
                    return  return CustomListItem(
                      name: data['name'],
                      expiry: data['expiry'],
                      addedOn: data['addedOn'],
                      thumbnail: Image.asset(data['thumbnail']));
                },
              ),
            ),
            
                  },
                );
        },
      ),