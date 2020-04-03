import 'package:flutter/material.dart';
import 'package:flutter_login/src/CoronaDashboard/about.dart';
import 'package:flutter_login/src/CoronaDashboard/advices.dart';
import 'package:flutter_login/src/CoronaDashboard/stats.dart';



class CoronaDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Virus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Corona Virus Tracker'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Stats",
                ),
                Tab(
                  text: "Maps",
                ),
                Tab(
                  text: "Advices",
                ),
                Tab(
                  text: "About",
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              StatsPage(),
              AdvicesPage(),
              AboutPage(),
              AboutPage()
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}