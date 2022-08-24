import 'package:flutter_redux_km2miles/redux/actions.dart';
import 'package:flutter_redux_km2miles/redux/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  AppState? newState;
  if (action is UpdateKm) {
    newState = AppState.copywith(prev: prevState, km: action.payload);
  } else if (action is Convert) {
    double kmAsDouble = double.parse(prevState.km!);
    double milesAsDouble = kmAsDouble * 0.621371;

    newState =
        AppState.copywith(prev: prevState, miles: milesAsDouble.toString());
  }
  return newState!;
}
