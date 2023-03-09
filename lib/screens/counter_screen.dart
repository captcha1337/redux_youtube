import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../common/common_template.dart';
import '../redux/actions.dart';
import '../redux/app_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(ResetCounter()),
        child: const Icon(Icons.restart_alt),
      ),
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: CommonTemplate(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => store.dispatch(IncrementAction()),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 35),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => store.dispatch(DecrementAction()),
                child: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
