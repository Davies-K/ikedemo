import 'package:flutter/material.dart';
import 'package:ikedemo2/screen/constants.dart';

class ClaimView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClaimState();
  }
}




class ClaimState extends State<ClaimView> {
  @override
  Widget build(BuildContext context) {
    
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        length: 3,
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new TabBar(
          tabs: [
            Tab(text: "Flight"),
            Tab(text: "Train"),
            Tab(text: "Bus"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0,
          ),
          child: new IntrinsicHeight(
            child: _buildMulticityTab(),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        Text("Inputs"), //TODO: Add MultiCity input
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.timeline, size: 36.0),
          ),
        ),
      ],
    );
  }
}
/*
class ClaimState extends State<ClaimView> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Text('Claims')),
      Center(child: Text('File a claim')),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.tag_faces), text: 'Claims'),
      Tab(icon: Icon(Icons.alarm), text: 'File for a Claim'),
    ];
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Claim",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor:primaryColor, 
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              
              bottom: PreferredSize(
                 preferredSize: const Size.fromHeight(125.0),
                child: new Container(
                  color:primaryColor,
                  child:TabBar(
                   tabs: _kTabs,
                   ),
                  ),
              ),
            ),
            body: TabBarView(children: _kTabPages
            )
        
                ));
  }
}



*/