import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Screens/ProfilePage.dart';
import 'package:sports_fields_rental/Services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => new _SignUpState();

}

class _SignUpState extends State<SignUp> {
  final authSvc = AuthService();
  final formKey = GlobalKey<FormState>();
  String password ='';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String gender = '';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.black,
            title: new Text('Sign up'),
            elevation:0.0,
            actions:<Widget>[
              FlatButton.icon(
                icon:Icon(Icons.person),
                color: Colors.white,
                label:Text("Log in"),
                onPressed: () {
                    widget.toggleView();
                },

              )
            ]
        ),
        body: Form(
            key:formKey,
              child: SingleChildScrollView(
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
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
                        onChanged: (val){
                          setState(() {
                            firstName = val;
                          });
                        },
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
                        onChanged: (val){
                          setState(() {
                            lastName = val;
                          });
                        },
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
                      TextFormField(
                        onChanged: (val){
                          setState(() {
                            email = val;
                          });
                        },
                        validator:(email) => !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)? "please input proper email":null,
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
                      TextFormField(
                        onChanged: (val){
                          setState(() {
                          password = val;
                          });
                        },
                        validator:(val) => val.length < 6? "Enter password longer than 6" : null,
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
                      TextFormField(
                        onChanged: (val){
                          setState(() {
                            gender = val;
                          });
                        },
//                          validator:(val) => (val.length != 1 || val != 'M' || val != 'F')? 'Please input M or F':null,
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
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (val){
                          setState(() {
                            phone = val;
                          });
                        },
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
                                onTap: () async {
                                 if(formKey.currentState.validate()){
                                   dynamic result = await authSvc.registerWithEmailPassword(email, password, firstName, lastName, gender, phone);
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => ProfilePage()),
//                                   );
                                 }else {
                                  print("not validate");
                                 }
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
              )
        )
    );
  }
}
