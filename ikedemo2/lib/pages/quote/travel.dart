import 'dart:async';
import 'dart:convert';
//import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ikedemo2/pages/quote/travelbenefit.dart';

import 'package:ikedemo2/models/travel.dart';


Future<http.Response> postRequest (_coverType,_distination,_ageRange,_startDate,_endDate,context) async {
	//var url ='http://10.0.2.2/PROJECTHANA/INSURANCE/v1/travel/index';

  var newTravel = new Travel(coverType:_coverType,distination: _distination,ageRange: _ageRange, startDate: _startDate, endDate: _endDate);

  var body = json.encode(newTravel.toMap());   //encode Map to JSON

  //Map data = {'coverType': _coverType,'startDate':_startDate,'endDate':_endDate};
  //var body = json.encode(data);   //encode Map to JSON

  var response = await http.post(newTravel.url,
      headers: {"Content-Type": "application/json"},
      body:body
  );

  var resp  = json.decode(response.body);
  final int statusCode = response.statusCode;
  var quoteAmount = resp['total'];

  if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
  }else{
      _showQuoteDialog(context,quoteAmount);
      //_showBenefitDialog(context);
  }

  return response;
}


void _showQuoteDialog(context,quoteAmount) {
   
  if(quoteAmount>1){

     showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Travel Insurance',textAlign: TextAlign.center,style: TextStyle(fontSize:20),),
            content: Padding( padding: EdgeInsets.symmetric(vertical:30),
              child: Text('GHS $quoteAmount',textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple,fontSize:40,fontWeight: FontWeight.bold ),)),
            actions: <Widget>[
              
              FlatButton(
                  onPressed:() {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Travelbenefit()),
                   );
                  },
                  child: Text('See Benefit')
              ),
              FlatButton(
                onPressed: () {
                  _showDeclarationDialog(context);
                },
                child: Text('Buy Now'),
              )
            ],
          );
      
        });
         }else{

        showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Getting Quote..',textAlign: TextAlign.center,),
                  content: SizedBox(height:80, child:Center(child:CircularProgressIndicator())),
                );
            
        });
    }
  }


 void _showBenefitDialog(context){
     showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Travel Insurance',textAlign: TextAlign.center,style: TextStyle(fontSize:20),),
            content: Padding( padding:EdgeInsets.symmetric(vertical:30),
            child: openWebview(),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                   Navigator.of(context).pop(true);
                  },
                  child: Text('Continue')
              ),
             
            ],
          );
        });
  }

  


  Widget openWebview() {
    return WebviewScaffold(
        url: "https:www.google.com/",
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....',style:TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  


  void _showDeclarationDialog(context){

    final  String _declaration = "I/We warrent the above statement and particulars are true and I/We hereby agree that this Declaration shall be held promissory and continuing effect and shall form the basis of in the deemed to be incorporated in the contract between me/us and the VANGUARD ASSURANCE COMPANY LIMITED, and I/We are willing to accept a policy subject to tearms prescribed by the Company therein and to pay the Premium";

     showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Travel Insurance',textAlign: TextAlign.center,style: TextStyle(fontSize:20),),
            content: Padding( padding: EdgeInsets.symmetric(vertical:30),
              child:Text('$_declaration',textAlign: TextAlign.left, style: TextStyle(color: Colors.brown,fontSize:15,fontWeight: FontWeight.bold ),)),
            actions: <Widget>[
            Center(
              child:FlatButton(
                  onPressed: () {
                   Navigator.of(context).pop(true);
                  },
                  child: Text('Continue')
                ),
                )
             
            ],
          );
      
        });
  }



class TravelQuote extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TravelQuoteState();
  }
}


class TravelQuoteState extends State<TravelQuote> {

  final _startDatecontroller = TextEditingController();
  final _enddatecontroller   = TextEditingController();
  var formatter = new DateFormat('yyyy-MM-dd');
  List<String> _coverType = ['CICL', 'LHL', 'VANGUARD SAVE'];
  String _selectedCover;

  List<String> _tripDistination =['Europe','Worldwide'];
  String _selectDistination;

  List<String> _ageRange =['Under 18','From 19-65','From 66-75','From 76-80'];
  String _selectAgeRange;
  String errormessge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(244, 242, 242, 1),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Travel Quote",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 41, 255, 1),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.symmetric(horizontal:15),
          margin: new EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset('assets/images/icons/travelquote.png',width:90,height:90,),
              ),
             SizedBox(height: 15,),
              new DropdownButton<String>(
                elevation: 90,
                isExpanded: true,
                hint: Text('Select Cover Type',
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
              new SizedBox(
                height: 16.0,
              ),
              new DropdownButton<String>(
                elevation: 90,
              
                isExpanded: true,
                hint: Text('Trip Duration',
                /*style: TextStyle(color: Colors.deepPurple)*/),
                items: _tripDistination.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: _selectDistination,
                onChanged: (String newValue) {
                  setState(() {
                    _selectDistination = newValue;
                  });
                },
              ),
              
              new SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: TextField(
                    controller: _startDatecontroller,  //CONTROLLER
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Start Date', 
                    ),
                  ),
                ),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      onChanged: (date) {}, onConfirm: (date) {
                    String _startdate = formatter.format(date);
                    _startDatecontroller.text = _startdate;
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
              ),
              new SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: TextField(
                    controller: _enddatecontroller,    //CONTROLLER
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Expiry Date',                   
                    ),
                    style: TextStyle(
                        //color: Colors.deepPurple,
                        //fontWeight: FontWeight.bold,
                        //fontSize: 15
                        ),
                  ),
                ),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      onChanged: (date) {}, onConfirm: (date) {
                    String _enddate = formatter.format(date);
                    _enddatecontroller.text = _enddate;
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
              ),
              new SizedBox(
                height: 16.0,
              ),
              new DropdownButton<String>(
                elevation: 90,
               
                isExpanded: true,
                hint: Text('Age Range',
               /* style: TextStyle(color: Colors.deepPurple)*/),
                items: _ageRange.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: _selectAgeRange,
                onChanged: (String newValue) {
                  setState(() {
                    _selectAgeRange = newValue;
                  });
                },
              ),
              new SizedBox(
                height:15.0,
              ),
              Text(errormessge,style:TextStyle(fontSize:15,color: Colors.red,fontWeight: FontWeight.bold),),
              new SizedBox(
                height: 22.0,
              ),
              new RaisedButton(
                onPressed: () 
                
                async {
                if(_selectedCover !=null && _selectDistination !=null && _selectAgeRange !=null && _startDatecontroller.text.isNotEmpty && _enddatecontroller.text.isNotEmpty){
                    postRequest (_selectedCover, _selectDistination,_selectAgeRange, _startDatecontroller.text,_enddatecontroller.text,context);
                  }else{
                    
                  errormessge = "Please all fields are required";
                }
                  },
                 padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                color: Color.fromRGBO(9, 106, 252, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                child: Container(
                  width:350,
                child: Text('Continue',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight:FontWeight.normal,
                  ),)),
              ),
              new SizedBox(
                height: 11.0,
              ),
            ],
          ),
        ),
      ),
    );
  }




}

