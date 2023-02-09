import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action),
    widget: _imageReducer(state.widget, action));

Reducer<Widget> _imageReducer = combineReducers([
  TypedReducer(_getImageReducer),
  TypedReducer(_loadedImageReducer),
]);

Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetTextAction>(_resetTextReducer),
]);
Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, IncrementAction>(_incrementCounter),
  TypedReducer<int, DecrementAction>(_decrementCounter),
  TypedReducer<int, ResetCounter>(_resetCounter),
]);

Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.widget;

Widget _getImageReducer(Widget widget, GetImageAction action) => const Center(
      child: CupertinoActivityIndicator(
        color: CupertinoColors.activeBlue,
      ),
    );

int _incrementCounter(int counter, IncrementAction action) => counter + 1;
int _decrementCounter(int counter, DecrementAction action) => counter - 1;
int _resetCounter(int counter, ResetCounter action) => counter = 0;

String _setTextReducer(String text, SetTextAction action) => action.text;
String _resetTextReducer(String text, ResetTextAction action) => '';


// AppState reducer(AppState state, dynamic action) {
//   return AppState(
//       counter: _counterReducer(state, action),
//       text: _textReducer(state, action));
// }

// int _counterReducer(AppState state, dynamic action) {
//   if (action is AddAction) {
//     return state.counter + 1;
//   } else if (action is RemoveAction) {
//     return state.counter - 1;
//   } else if (action is ResetCounter) {
//     return state.counter = 0;
//   } else {
//     return state.counter;
//   }
// }

// String _textReducer(AppState state, dynamic action) {
//   if (action is SetTextAction) {
//     return action.text;
//   } else if (action is RemoveAction) {
//     return state.text = '';
//   } else {
//     return state.text;
//   }
// }
