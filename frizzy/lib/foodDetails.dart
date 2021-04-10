import 'package:flutter/material.dart';
import 'package:frizzy/HomePage.dart';
import 'package:frizzy/gradientText.dart';
import 'package:frizzy/sizeconfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FoodDetails extends StatefulWidget {
  final String expiry;
  final String addedOn;
  final Widget thumbnail;
  final int daysleft;
  final String name;
  const FoodDetails(
      {this.addedOn, this.expiry, this.thumbnail, this.name, this.daysleft});
  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  String _expiry;
  int _daysLeft;
  @override
  void initState() {
    super.initState();
    _expiry = widget.expiry;
    _daysLeft = widget.daysleft;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical * 100;
    double w = SizeConfig.safeBlockHorizontal * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Item Details",
            textAlign: TextAlign.center,
            style: GoogleFonts.galdeano(
                textStyle: TextStyle(
                    color: Color(0xff218588),
                    fontSize: h * 0.032,
                    fontWeight: FontWeight.bold))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xff218588),
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Color(0xff218588),
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(w * 0.15),
            child: Center(child: widget.thumbnail),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.06),
            child: Center(
                child: GradientText(
              widget.name,
              gradient: LinearGradient(colors: [
                Color(0xff218588),
                Color(0xff40E0D0),
              ]),
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: w * (0.07), vertical: h * (0.07)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("Added On",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.galdeano(
                              textStyle: TextStyle(
                                  color: Color(0xff747292),
                                  fontSize: h * 0.032,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(
                        height: h * (0.02),
                      ),
                      Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22.0)),
                        ),
                        child: SizedBox(
                          width: w * 0.4,
                          child: Padding(
                            padding: EdgeInsets.all(h * (0.008)),
                            child: Text(
                              widget.addedOn,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.galdeano(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: h * 0.032,
                                      fontWeight: FontWeight.normal)),
                              //decoration: InputDecoration(hintText: 'Enter phone number'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Expiry",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.galdeano(
                                  textStyle: TextStyle(
                                      color: Color(0xff747292),
                                      fontSize: h * 0.032,
                                      fontWeight: FontWeight.bold))),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xff218588),
                              size: 25,
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2022),
                              ).then((value) {
                                DateFormat formatter = DateFormat('yyyy-MM-dd');
                                setState(() {
                                  _expiry = formatter.format(value);
                                  _daysLeft = (-1) *
                                      DateTime.now().difference(value).inDays;
                                });
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * (0.01),
                      ),
                      Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22.0)),
                        ),
                        child: SizedBox(
                          width: w * (0.4),
                          child: Padding(
                            padding: EdgeInsets.all(h * (0.008)),
                            child: Text(
                              _expiry,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.galdeano(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: h * 0.032,
                                      )),
                              //decoration: InputDecoration(hintText: 'Enter phone number'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: w * (0.07), vertical: h * 0.02),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Remaining Days",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.galdeano(
                          textStyle: TextStyle(
                              color: Color(0xff747292),
                              fontSize: h * 0.029,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                    ),
                    child: SizedBox(
                      width: w * 0.3,
                      child: Padding(
                        padding: EdgeInsets.all(h * (0.008)),
                        child: Text(
                          _daysLeft.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.varelaRound(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: h * 0.032,
                                  fontWeight: FontWeight.bold)),
                          //decoration: InputDecoration(hintText: 'Enter phone number'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
