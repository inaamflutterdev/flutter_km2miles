import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_km2miles/redux/reducers.dart';
import 'package:flutter_redux_km2miles/redux/store.dart';
import 'package:flutter_redux_km2miles/screens/home_screen.dart';
import 'package:redux/redux.dart';

void main() {
  Store<AppState> store =
      Store<AppState>(reducers, initialState: AppState.initial());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  //ok?

  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
