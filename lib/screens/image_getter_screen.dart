import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../common/common_template.dart';
import '../redux/actions.dart';
import '../redux/app_state.dart';

class ImageGetterScreen extends StatelessWidget {
  const ImageGetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Image getter'),
      ),
      body: CommonTemplate(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: double.maxFinite,
                margin: const EdgeInsets.all(5),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, vm) => vm.widget,
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (() => store.dispatch(loadImageThunkAction(store))),
              child: const Text('Get image'),
            ),
          ],
        ),
      ),
    );
  }
}
