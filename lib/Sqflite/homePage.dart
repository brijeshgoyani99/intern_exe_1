import 'package:flutter/material.dart';
import 'package:internprac1/Sqflite/otherPage.dart';
import 'package:internprac1/Sqflite/utils/database.dart';
import 'package:internprac1/Sqflite/models/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Username",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextField(onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    })
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextField(onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    })
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    var newDBUser =
                        User(username: username, password: password);
                    DBProvider.db.newUser(newDBUser);
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return SecondPage();
                    }));
                    print('save');
                  },
                  child: Text("save"),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
