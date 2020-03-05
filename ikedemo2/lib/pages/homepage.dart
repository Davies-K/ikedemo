import 'package:flutter/material.dart';
import 'package:ikedemo2/pages/quote/motor.dart';
import 'package:ikedemo2/screen/constants.dart';
//import 'package:ikedemo/pages/productpage.dart';
import 'package:ikedemo2/pages/claimpage.dart';
//import 'package:ikedemo/pages/policypage.dart';
//import 'package:ikedemo/pages/grideview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ikedemo2/pages/quote/travel.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeviewState();
  }
}

class HomeviewState extends State<HomeView> {
  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: 230,
            child: ListView(
              children: <Widget>[
               Container(
                 padding: EdgeInsets.only(top:18),
                  child: Center(
                  child: Text(
                    'Select Insurance Product',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                  ),
                ),
               ),
                SizedBox(height:8),
                Divider(height: 2.0,),
                                new ListTile(
                  leading: new Image.asset(
                    'assets/images/icons/travel.png',
                    width: 30,
                    height: 30,
                  ),
                  title: new Text(
                    'TRAVEL',
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize:15),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TravelQuote()),
                    ),
                  },
                ),
                Divider(height: 2.0,),
                new ListTile(
                    leading: Image.asset(
                      'assets/images/icons/motor.png',
                      width:30,
                      height:30,
                    ),
                    title: new Text(
                      'MOTOR INSURANCE',
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize:15),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    onTap: () => {

                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Motorquote()),
                    ),
                    }
                    ),
                Divider(height: 2.0,),

                new ListTile(
                  leading: new Image.asset(
                    'assets/images/icons/fire.png',
                    width: 40,
                    height: 40,
                  ),
                  title: new Text(
                    'FIRE',
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize:15),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () => {},
                ),
                Divider(height: 2.0,),
              /*  new ListTile(
                  leading: new Image.asset(
                    'assets/images/icons/accident.png',
                    width: 40,
                    height: 40,
                  ),
                  title: new Text(
                    'ACCIDENT',
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize:15),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () => {},
                ), */
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Stack(
        //alignment: AlignmentGeometry,
        children: <Widget>[
          Column(
            children: <Widget>[
              slider(context),
              SizedBox(
                height: 30,
              )
            ],
          ),
          Positioned(
              top: 150,
              left: 10,
              right: 10,
              child: actionContainer(context, _showBottom)),
        ],
      ),

      SizedBox(height: 5),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Find Insurances"),
        ],
      ),

      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10), 
        height: MediaQuery.of(context).size.height * 0.35,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Column(
                    children: <Widget>[
                      Icon(Icons.adb, color: Colors.green, size: 50), 
                      Text("Theft")

                  ],),

                  Column(
                    children: <Widget>[
                      Icon(Icons.filter_hdr, color: Colors.orange, size: 50), 
                      Text("Fire")

                  ],),

                  Column(
                    children: <Widget>[
                      Icon(Icons.local_car_wash, color: Colors.blue,size: 50), 
                      Text("Crash")

                  ],)

                  
                ]
              ),
            ), 
            Divider(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                Column(
                  children: <Widget>[
                    Icon(Icons.line_style, color: Colors.blue,size: 50), 
                    Text("Flood")

                ],),

                Column(
                  children: <Widget>[
                    Icon(Icons.border_all, color: Colors.redAccent, size: 50), 
                    Text("Hall")

                ],),

                Column(
                  children: <Widget>[
                    Icon(Icons.cloud, color: Colors.indigo, size: 50), 
                    Text("Lightning")

                ],)

                
              ]
            ),
          ],


        ),

      )
      // This is where the product slider dey
      // ProductList(),
      //BottomButtons(),
    ]);
  }
}

Widget slider(context) {
  return CarouselSlider(
    height: MediaQuery.of(context).size.height * 0.35,
    autoPlay: true,
    items: ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg'].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage("assets/images/banners/" + i),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget actionContainer(context, _showBottom) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.18,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical:5),
    margin: EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: primaryColor,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(
        children: <Widget>[
          Center(
            child: Text(
              'Quick Actions',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          actionMenuRow(context, _showBottom),
        ],
      )
    ]),
  );
}

Widget actionMenuRow(context, _showBottom) {
  return Container(
    padding: EdgeInsets.only(
      top: 8,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
            child: Column(
              children: <Widget>[
                Icon(Icons.receipt, color: Colors.white, size: 30),
                Text(
                  'Get Quote',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            onPressed: _showBottom),
        FlatButton(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.redeem,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Renew",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClaimView()),
            );
          },
        ),
        FlatButton(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.assignment,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'Claims',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClaimView()),
              );
            })
      ],
    ),
  );
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         
        children:<Widget>[
         Padding(
          padding: EdgeInsets.only(top:40,bottom: 0),
          child:Text('Our Products',style: TextStyle(fontWeight:FontWeight.bold,fontSize:18),),
         ),
     Container(
      //color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal:12.0, vertical: 20.0),
      height: MediaQuery.of(context).size.height * 0.25,
      //margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: insuranceProduct.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: GestureDetector(
                  onTap: () {
                    print(insuranceProduct[index]);
                  },
                  child: Card(
                    elevation: 1.5,
                    color:Colors.white, //productBgColor[insuranceProduct[index]],
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Center(
                              child: Image.asset(
                                  "assets/images/icons/" +
                                      productImage[insuranceProduct[index]] +
                                      ".png",
                                  width: 30,
                                  height: 30)),
                          SizedBox(height: 8),
                          Center(
                              child: Text(
                            insuranceProduct[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.9,
                                fontWeight: FontWeight.w300),
                          )),
                        ])),
                  )),
            );
          }),
       )]);
  }
}

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: Color.fromRGBO(239, 238, 237, 1))),
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.32,
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.file_download,
                    size: 35,
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      'Download ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Center',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.32,
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.settings_phone,
                    size: 35,
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      'Hotlines ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.32,
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    size: 35,
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      'Offices / ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Agents ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}


class TopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 41, 255, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Comprehensive",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "VNDC-156700P",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "260 days left",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
