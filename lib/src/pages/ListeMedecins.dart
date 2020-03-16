import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_login/src/models/User.dart';
import 'detail.dart';

class ListeMedecins extends StatefulWidget {
  ListeMedecins({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _ListeMedecinsState createState() => _ListeMedecinsState();
}

class Medecin {
  final String img;
  final String title;
  final String body;

  Medecin(this.img, this.title, this.body);
}

class _ListeMedecinsState extends State<ListeMedecins> {
  List<Medecin> items = new List<Medecin>();
 List data;



  _ListeMedecinsState() {
    /* Fetching Data Into ListView */

    Future<String> getData() async {
      var response = await http.get(
          Uri.encodeFull("http://10.0.2.2:4000/user/GetAllMedecins"),
          headers: {
            "Accept": "application/json"
          }
      );

      this.setState(() {

        this.data = json.decode(response.body);
      });


      return "Success";
    }

   // await getData()  ;  // <--- your code needs to pause until the Future returns.
    print('GET  DATA GET ');
    getData().then((data){
      for(int i=0 ; i<this.data.length;i++){
        print(this.data[i]["email"]);
        print(i);
        items.add(new Medecin("assets/images/hulk.png", this.data[i]["nom"], this.data[i]["email"]));
      }
    });

    /* Fetching Data Into ListView */
  }

  Widget MedcCell(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDetailPage(items[index])));
      },
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: items[index],
                      child: Image.asset(items[index].img),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      items[index].title,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next, color: Colors.black38),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => MedcCell(context, index),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
