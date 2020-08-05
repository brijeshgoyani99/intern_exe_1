import 'package:flutter/material.dart';
import 'package:internprac1/Sqflite/utils/Database.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Map<String, String> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userFuture = getuser();
  }

  getuser() async {
    final _userData = await DBProvider.db.getUser();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Show"),
        ),
        body: FutureBuilder(
            future: _userFuture,
            builder: (_, userData) {
              switch (userData.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                  return Container();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (!newUser.containsKey('username')) {
                    newUser = Map<String, String>.from(userData.data);
                  }
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text("Username: "+
                              newUser['username'],
                              style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                          Text("Password: "+
                            newUser['password'],
                            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  );
              }
            }));
  }
}
