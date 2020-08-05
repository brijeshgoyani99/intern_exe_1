//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'flavor.dart';

@immutable
class AppState {
  final counter;
  AppState(this.counter);
}

enum Actions { Increment }

AppState reducer(AppState prev, action) {
  if (action == Actions.Increment) {
    return AppState(prev.counter + 1);
  }

  return prev;
}

//===== Async and Await (future method)...==== ======================

// int callback(int value) {
//   return (value + 1) * 2;
// }

// Duration interval = Duration(seconds: 1);
// Stream<int> number = Stream<int>.periodic(interval, callback);
// Stream<int> x = number.take(10);
// //Stream<int> number1 = number.take(5);
// Future<int> getTotal(Stream<int> numbers) async {
//   int total = 0;
//   await for (int i in numbers) {
//     print(i);
//     total += i;
//   }
//   //total=50;
//   return total;
//   // await for (final value in numbers) {
//   //     total+=value;
//   // }
//   // return total;
// }
//====================================================//

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final store = new Store(reducer, initialState: new AppState(0));

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text(flavor.toString()),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("increment... " + store.state.counter.toString()
                  // getTotal(x).toString(),
                  ),
              StoreConnector(
                converter: (store) => store.state.counter,
                builder: (context, counter) => Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(Actions.Increment);
          },
          builder: (context, callback) => FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
