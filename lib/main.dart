// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'common/common_template.dart';
import 'screens/counter_screen.dart';
import 'screens/image_getter_screen.dart';
import 'screens/set_text_from_textfield_screen.dart';
import 'redux/app_state.dart';
import 'redux/reducers.dart';

void main() {
  Store<AppState> store = Store(reducer,
      initialState: AppState(
        counter: 0,
        text: '',
        widget: const Icon(Icons.image),
      ));

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(initialRoute: '/', routes: {
        '/': (context) => const _Counter(),
        '/counter_page': (context) => const CounterScreen(),
        '/image_getter_page': (context) => const ImageGetterScreen(),
        '/set_text_from_textfield_page': (context) =>
            SetTextFromTextfieldScreen(),
      }),
    ),
  );
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Redux'),
      ),
      body: CommonTemplate(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter_page');
                },
                child: const Text('Counter')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/image_getter_page');
                },
                child: const Text('Image getter')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/set_text_from_textfield_page');
                },
                child: const Text('Text setter'))
          ],
        )),
      ),
    );
  }
}
