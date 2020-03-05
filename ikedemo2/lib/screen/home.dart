import 'package:flutter/material.dart';
import 'package:ikedemo2/pages/homepage.dart';
import 'package:ikedemo2/pages/productpage.dart';
import 'package:ikedemo2/screen/constants.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  final widgetOptions = <Widget>[
    HomeView(),
    Center(child: Text('My Profile')),
    Center(child: Text('Payment')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context){

    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Isaac Gyasi Nimako'),
      accountEmail: Text('gyasi@email.com'),

      currentAccountPicture: CircleAvatar(
          backgroundColor: Color.fromRGBO(0, 41, 255, 1),
          child: Image.asset('assets/images/bed.gif'),
      ),
      // otherAccountsPictures: <Widget>[
      //   CircleAvatar(child: Text('A') ,
      //   backgroundColor: Colors.yellow,
      //   ),
      //  CircleAvatar(child: Text('A'),
      //   backgroundColor: Colors.red, 
      //  ),
      // ],
    );
    
    var item1 = new ListTile(title: Text('Insurance Product'), leading: Icon(Icons.card_giftcard),  onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(),
                ),
              );
            },);
    var item2 = new ListTile(title: Text('About Us'), leading: Icon(Icons.person), onTap: _onItem1OnTap);
    var item3 = new ListTile(title: Text('Hotlines'), leading: Icon(Icons.phone), onTap: _onItem1OnTap);
    var item4 = new ListTile(title: Text('Terms & Condition'), leading: Icon(Icons.settings), onTap: _onItem1OnTap);
    var item5 = new ListTile(title: Text('logout'), leading: Icon(Icons.cancel), onTap: _onItem1OnTap);
     AboutListTile(applicationIcon: Icon(Icons.next_week));

    var children = [drawerHeader, item1,Divider(),item2,item3,item4,Divider(),item5];
    var drawer = new Drawer(child: ListView(children: children));

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 242, 242, 1),
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('Home',textAlign: TextAlign.center, style:TextStyle(color: Colors.white)),
        backgroundColor:primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
       /* actions: <Widget>[
          Icon(Icons.notifications),
        ],*/
      ),

      drawer: drawer,

      body: widgetOptions[_selectedIndex],

     /* floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(0, 41, 255, 1),
        child: new Icon(Icons.rate_review),
        onPressed: () {},
      ), */


      //bottomNavigationBar: BottomNav(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open),
              title: Text('My Policies'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              title: Text('Payment'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(0, 41, 255, 1),
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
  void _onItem1OnTap() {
    Navigator.pop(context);
  }
  
}
