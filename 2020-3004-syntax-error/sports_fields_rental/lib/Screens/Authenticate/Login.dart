import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Constant/Constant.dart';
import 'package:sports_fields_rental/Services/auth.dart';
import 'SignUp.dart';
import 'package:sports_fields_rental/Screens/ProfilePage.dart';
import 'package:sports_fields_rental/Filter.dart';


class Login extends StatelessWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        SIGNUP: (BuildContext context) => SignUp(toggleView: this.toggleView)
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function toggleView;
  MyHomePage({this.toggleView});
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String password = "";
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.black,
            title: new Text('Login'),
            elevation:0.0,
            actions:<Widget>[
              FlatButton.icon(
                icon:Icon(Icons.person),
                color: Colors.white,
                label:Text("Sign up"),
                onPressed: () async{
                    widget.toggleView();
                },

              )
            ]
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                  'Sport Fields Rental',
                  style: TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 30.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged:(val){
                        setState(() {
                          email = val;
                        });
                    },
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged:(val){
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      padding: EdgeInsets.only(top: 10.0, left: 245.0),
                      child: InkWell(
                          child: Text('Forgot Password?',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline
                            ),
                          )
                      )
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                            onTap: () => onclickButton(context),
                            child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                )
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 40.0),
                  // RaisedButton(
                  //   child : Text("Sign in anon"),
                  //   onPressed: ()
                  // )
                  Container(
                    height: 40.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                            onTap: () async{
                                    dynamic result = await _auth.signInAnon();
                                    if(result == null){
                                      print('error signin');
                                    }else{
                                      print('ok signin');
                                    }
                            },
                            child: Center(
                                child: Text(
                                  'Anonymous LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                )
                            )
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New User? ',
                  style: TextStyle(
                      fontFamily: 'Montserrat'
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SIGNUP);
                  },
                  child: Text('Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),),
                )
              ],
            )
          ],
        )
    );
  }

  onclickButton(BuildContext context) async{
    dynamic result = await _auth.signInWithEmailPassword(email, password);
    if(result == null){
      Widget continueButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Wrong Email/Password'),
          content: new Text("Please Try Again"),
          actions: [
            continueButton,
          ],
        ),
      );
    }else{
        print("login success");
    }
  }
}