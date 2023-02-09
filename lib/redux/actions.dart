import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class IncrementAction {
  late int count;

  // IncrementAction(this.count);
}

class DecrementAction {}

class ResetCounter {}

class ResetTextAction {}

class SetTextAction {
  late String text;

  SetTextAction({required this.text});
}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}

// ThunkAction incCountThunkAction = (Store store) async {
//   compute(calc, 1).then((value) => store.dispatch(IncrementAction(value)));
// };

// Future<int> calc(int count) async {
//   int result = 0;
//   for (var i = 0; i < count; ++i) {
//     result++;
//   }
//   return result;
// }

ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage('https://picsum.photos/1920/1080')
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  return Image.network(url);
}
