import 'package:flutter/material.dart';
import 'main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                  'CREATE YOUR ACCOUNT',
                  style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'FIRSTNAME',
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
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'LASTNAME',
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
                  SizedBox(height: 10),
                  TextField(
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
                  SizedBox(height: 10),
                  TextField(
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
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'GENDER',
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
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'PHONE NUMBER',
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

                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/main');
                            },
                            child: Center(
                                child: Text(
                                  'SIGNUP',
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
                  SizedBox(height: 10),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text('BACK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                            )
                          )
                          )
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        )
    );
  }
}
