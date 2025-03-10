import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Available Times:'),
      ),
      body:
      new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "8:00 A.M. - 9:00 A.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "9:00 A.M. - 10:00 A.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "10:00 A.M. - 11:00 A.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "11:00 A.M. - 12:00 A.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "1:00 P.M. - 2:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "1:00 P.M. - 2:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(
                key: null,
                onPressed: buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "2:00 P.M. - 3:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "3:00 P.M. - 4:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "4:00 P.M. - 5:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "5:00 P.M. - 6:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new RaisedButton(key:null, onPressed:buttonPressed,
                color: Colors.green,
                child:
                new Text(
                  "6:00 P.M. - 7:00 P.M.",
                  style: new TextStyle(fontSize:15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(key:null, onPressed:buttonPressed,
                      color: Colors.green,
                      child:
                      new Text(
                        "7:00 P.M. - 8:00 P.M.",
                        style: new TextStyle(fontSize:15.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                  )
                ]

            )
          ]

      ),

    );
  }
  void buttonPressed(){
  }

}
