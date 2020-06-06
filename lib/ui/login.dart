import 'package:flutter/material.dart';
import 'package:faynmann/ui/mainpage.dart';
import 'package:faynmann/ui/filter.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginPage();
  }
}

class loginPage extends State<Login> {

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final btnclr = const Color(0x1a2e58);
  final _formKey = GlobalKey<FormState>();
  void login(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage('images/bg.png'), fit: BoxFit.fill)),
            child: new Container(
              padding: EdgeInsets.only(top: 0),
              child: new Form(
                key: _formKey,
                child: new ListView(
                  padding: const EdgeInsets.all(2.0),
                  children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.all(3.0),
                        width: MediaQuery.of(context).size.width,
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Email can't be empty";
                                      }
                                      return null;
                                    },
                                    controller: _email,
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Colors.white30,fontSize: 14),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        icon: new Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        )),
                                  ),
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.06,left: 22, bottom: 14,top: 460),
                              ),
                              new Container(
                                width: MediaQuery.of(context).size.width,
                                child: new TextFormField(
                                  controller: _password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                      fillColor: Colors.black.withOpacity(0.6),
                                      hintText: "password",
                                      hintStyle: TextStyle(color: Colors.white30,fontSize: 14),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      icon: new Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      )),
                                  style: TextStyle(color: Colors.black),
                                  obscureText:true,

                                ),
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.06,left: 22),
                              ),
                              new Container(
                                padding: EdgeInsets.only(bottom: 5,top: 35),
                                height: 90,
                                width: MediaQuery.of(context).size.width*0.70,
                                child: Hero(
                                    tag: 'LoginBtn',
                                    child: new RaisedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          // If the form is valid, display a Snackbar.
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                  Text('Processing Data')));
                                        }

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MainPage()),
                                        );
                                        },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: new Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 15, color: Color(0xFF0059B1), fontWeight: FontWeight.w700),
                                      ),

                                      elevation: 15,
                                    ),

                                ),
                              ),
                              new Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.70,
                                child: Hero(
                                    tag: 'LoginBtn2',
                                    child: new RaisedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          // If the form is valid, display a Snackbar.
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                  Text('Processing Data')));
                                        }

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MainPage()),
                                        );
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: new Text(
                                        "Login with Facebook",
                                        style: TextStyle(
                                            fontSize: 15, color: Color(0xFF0059B1), fontWeight: FontWeight.w700),
                                      ),

                                      elevation: 15,
                                    )
                                ),
                              ),
                              new Container(
                                width:MediaQuery.of(context).size.width*0.9,
                                height: MediaQuery.of(context).size.height*0.075,
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.19,right:MediaQuery.of(context).size.width*0.15),
                                child: Row(children: <Widget>[
                                  Container(
                                    child: Text(
                                      "New User? Please",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(right: 7),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 0),
                                      child:Text(
                                        "Register",
                                        style: TextStyle(
                                          color: Color(0xFF00A1ED),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                  )

                                ],),
                              ),
                              new Padding(padding: new EdgeInsets.only(left: 40,bottom: 50)),
                            ],
                          ),
                          padding: EdgeInsets.only(left: 30, right: 40),
                        )),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
