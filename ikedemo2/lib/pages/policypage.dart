import 'package:flutter/material.dart';

class PolicyView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PolicyState();
  }
}

class PolicyState extends State<PolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "My Policy",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(0, 41, 255, 1),
        iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: 
        Container(
        color: Color.fromRGBO(0, 41, 255, 1),
        child:Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(0, 41, 255, 1),
              height: 110,
              child: Center(child:linkPolicyButton()),
            ),
            Container(
              height: 402,
              margin: EdgeInsets.symmetric(horizontal:8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 247, 249, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),        
              ),
              child: Center(child:linkPolicyButton()),
            )
          ],
        )));
  }
}


Widget linkPolicyButton (){
        return FlatButton(
        
                padding: EdgeInsets.symmetric(
                  vertical:10,horizontal: 120
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  40,
                )),
                child: Text(
                  "Link Policy",
                  style: TextStyle(
                    fontSize: 20,
                   color: Color.fromRGBO(0, 41, 255, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                 
                },
                color: Colors.white,
        );
}