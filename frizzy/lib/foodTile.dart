import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frizzy/foodDetails.dart';
import 'package:frizzy/sizeconfig.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.name,
    this.addedOn,
    this.expiry,
    this.thumbnail,
  });

  final Widget thumbnail;
  final String expiry;
  final String addedOn;
  final String name;

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeCreatedAt = DateTime.parse(expiry);
    int _daysLeft = (-1)*DateTime.now().difference(dateTimeCreatedAt).inDays;
    double h = SizeConfig.safeBlockVertical * 100;
    double w = SizeConfig.safeBlockHorizontal * 100;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01,horizontal: w*0.05),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FoodDetails(addedOn: addedOn,expiry: expiry,thumbnail: thumbnail,daysleft:_daysLeft,name: name,)));
        },
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 2,
            color:Color(0xff218588) ,
            style: BorderStyle.solid,
          ),),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: h * 0.15,
                child: thumbnail,
              ),
              Expanded(
                flex: 2,
                child: _ItemDescription(
                  name: name,
                  addedOn: addedOn,
                  expiry: expiry,
                ),
              ),
              Expanded(
                flex: 1,
                child:Text(
                  _daysLeft.toString()+"D",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Theme.of(context).primaryColor),
                    fontSize: h * 0.029,
                    fontWeight: FontWeight.bold,

                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    this.name,
    this.addedOn,
    this.expiry,
  });

  final String expiry;
  final String addedOn;
  final String name;

  @override
  Widget build(BuildContext context) {
    double h = SizeConfig.safeBlockVertical * 100;
    double w = SizeConfig.safeBlockHorizontal * 100;
    return Padding(
      padding: EdgeInsets.fromLTRB(w * (0.05), 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Color(0xff218588).withOpacity(0.80)),
              fontWeight: FontWeight.bold,
              fontSize: h * 0.032,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Added: " + addedOn,
            style: GoogleFonts.galdeano(
              textStyle: TextStyle(color: Color(0xff396884).withOpacity(0.80)),
              fontSize: h * 0.02,
                fontWeight: FontWeight.bold
            ),
          ),

          Text(
            "Expiry: " + expiry,
            style: GoogleFonts.galdeano(
              textStyle: TextStyle(color: Color(0xff396884).withOpacity(0.80)),
              fontSize: h * 0.02,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
