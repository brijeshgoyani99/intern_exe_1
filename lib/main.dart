import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flavor.dart';
import 'my_app.dart';

void main() => runApp(Provider<Flavor>.value(
        value: Flavor.dev,
        child: MyApp())
    );

//===> Sqflite...NumberInputElement

// import 'package:flutter/material.dart';
// import 'package:internprac1/Sqflite/homePage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
          //debugShowCheckedModeBanner: false,
//       title: 'Material App',
//       home: LoginPage(),
//     );
//   }
// }
