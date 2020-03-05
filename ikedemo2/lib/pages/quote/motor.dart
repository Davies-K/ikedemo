import 'dart:async';
import 'dart:convert';
//import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class Motorquote extends StatefulWidget {

   Motorquote({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MotorquoteState createState() => _MotorquoteState();
}

class _MotorquoteState extends State<Motorquote> {

  final _startDatecontroller = TextEditingController();
  final _enddatecontroller   = TextEditingController();
  var formatter = new DateFormat('yyyy-MM-dd');
  List<String> _coverType = ['GHS', 'DOL', 'EUR'];
  String _selectedCover;

  List<String> _tripDistination =['Europe','Worldwide'];
  String _selectDistination;

  List<String> _ageRange =['Under 18','From 19-65','From 66-75','From 76-80'];
  String _selectAgeRange;
  String errormessge = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
                          Container(
                  
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 8,

                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                        color: Colors.blue,

                        ),

                        

                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Padding(
                    padding: const EdgeInsets.only(top: 35, left: 15),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 50),
                  child: Text("Quote", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, 
                    fontWeight: FontWeight.bold

                  ),),
                ),
            ],

          ), 

          SizedBox(height: MediaQuery.of(context).size.height / 40,),

          Container(

                  width: MediaQuery.of(context).size.width * 0.98,
          height: MediaQuery.of(context).size.height * 0.82,

          
          
         decoration: BoxDecoration(
            color: Colors.blue, 
            borderRadius: BorderRadius.all(Radius.circular(8),
            
            
                        
          ),

          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                                ),
                                ]

          ), 

          child: Container(
            margin: EdgeInsets.all(20), 
            child: Column(
            
            children: <Widget>[

              Text("Start your motor quote.", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 20
              )),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Select Currency:", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),),

                    child: new DropdownButton<String>(
                elevation: 90,
                isExpanded: true,
                hint: Text('Select Currency Type',
                style: TextStyle(
                  fontSize: 13
                ),
                    //style: TextStyle(color: Colors.deepPurple)
                    ),
                items: _coverType.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: _selectedCover,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedCover = newValue;
                  });
                },
              ),

                    // child : new DropdownButton<String>(
                    //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    //       return new DropdownMenuItem<String>(
                    //         value: value,
                    //         child: new Text(value, style: TextStyle(
                    //           color: Colors.black
                    //         ),),
                    //       );
                    //     }).toList(),
                    //     onChanged: (_) {

                    //     },
                    //   )
                  ) 
                  
                  
                  

              ],
              ), 

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Select Cover:    ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Select a Usage:", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Vehicle Value:   ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Year of Make:    ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Number of Seats:  ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Select Duration:", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Cubic Capacity:", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Select Claimfree:   ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Buy Tppd:        ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ),

                  SizedBox(height: 15),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text("Buy Excess:    ", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold

                  ),), 

                  Container(
                    width: 200, 
                    height: 25, 
                   
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      
                      
                                  
                    ),)
                  )]
                  ), 
                  SizedBox(height: 10),

                  Row(
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          
                          onPressed: null, child: Text("GET A QUOTE", style: TextStyle(
                            color: Colors.white, 
                          ),), 
                          ),
                      ), 

                        Padding(
                          padding: EdgeInsets.only(left : 8.0),
                          child: Text("GHS 297.19", style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 16
                          )),
                        )

                  ],)

          ],
          ),
          ),
          )]
      ),

    // body: Stack(
      
      

    //   children: <Widget>[
    //     Container(
    //       color: Colors.white,
    //       height: MediaQuery.of(context).size.height,
    //       width: MediaQuery.of(context).size.width,

    //     ),

    //     Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height / 6,
    //       decoration: BoxDecoration(
    //         color: Colors.lightBlueAccent, 
    //         borderRadius: BorderRadius.only(
    //                     bottomLeft: Radius.circular(30),
    //                     bottomRight: Radius.circular(30)),
    //       ),
    //     ), 

    //     Container (
          
          
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       height: MediaQuery.of(context).size.height * 0.7,
    //       margin: EdgeInsets.only(top: 150),
    //      decoration: BoxDecoration(
    //         color: Colors.lightBlueAccent, 
    //         borderRadius: BorderRadius.all(Radius.circular(30)
                        
    //       ),


    //     ),

    //     )],

    // ),
      

    );
  }
}