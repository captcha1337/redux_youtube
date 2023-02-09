// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../common/common_template.dart';
import '../redux/actions.dart';
import '../redux/app_state.dart';

class SetTextFromTextfield extends StatelessWidget {
  SetTextFromTextfield({super.key});

  final String clearInputText = '';
  String inputText = '';

  final TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set text from TextField'),
      ),
      body: CommonTemplate(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: ((context, vm) => Text(
                  vm.text,
                  style: const TextStyle(fontSize: 30),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Type any text',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                controller: textarea,
                onChanged: (value) => inputText = value),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () => {
                    store.dispatch(SetTextAction(text: inputText)),
                    textarea.clear()
                  },
              child: const Text('Set')),
          ElevatedButton(
              onPressed: () {
                store.dispatch(SetTextAction(text: clearInputText));
                inputText = clearInputText;
              },
              child: const Text('Clear textfield')),
        ],
      )),
    );
  }
}
