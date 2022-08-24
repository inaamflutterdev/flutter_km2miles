import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_km2miles/redux/actions.dart';
import 'package:flutter_redux_km2miles/redux/store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(" Flutter & Redux"),
        elevation: 5,
        shadowColor: Colors.lightGreenAccent,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Enter distance in KM",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "KM",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 1.5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => StoreProvider.of<AppState>(context)
                      .dispatch(UpdateKm(val))),
            ),
            Text(
              state.miles!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 35,
              width: 180,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.rotate_right,
                  color: Colors.black,
                  size: 24.0,
                ),
                label: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () =>
                    StoreProvider.of<AppState>(context).dispatch(Convert()),
                style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
