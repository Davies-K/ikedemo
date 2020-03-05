import 'package:flutter/material.dart';
import 'package:ikedemo2/screen/bluepaint.dart';
import 'package:ikedemo2/screen/home.dart';
import 'package:ikedemo2/screen/constants.dart';

class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<ProductView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 242, 242, 1),
        appBar: AppBar(
          elevation: 0.0,
          // title: Text(
          //   "Product",
          //   style: TextStyle(color: Colors.white),
          // ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(0, 41, 255, 1),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: CustomPaint(
        painter: BluePainter(),
           child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              color: Color.fromRGBO(0, 41, 255, 1),
              height: 110,
              child: Text(
                'Our Product',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            productWraper(context),
          ],
        )));
  }
}

Widget productWraper(context) {
 
  return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Available Products',
            style:TextStyle(fontWeight:FontWeight.w300,fontSize:20,color:Colors.white),
            ),
             SizedBox(
                  height:7,
                ),
            Wrap(
              spacing: 8,
              runSpacing: 10.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: insuranceProduct
                  .map((String name) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Card(
                          elevation: 3.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          child: Container(
                              width: 150,
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding: EdgeInsets.all(19),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Image.asset(
                                            "assets/images/icons/" +
                                                productImage[name] +
                                                ".png"),
                                      ),
                                Text(
                                  name,
                                  //textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize:16 ,fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]
                              )))))
                  .toList(),
            )
          ]));
}



