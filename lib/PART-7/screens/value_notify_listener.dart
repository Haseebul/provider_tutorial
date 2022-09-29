import 'package:flutter/material.dart';

class ValueNotifyListenerScreen extends StatelessWidget {
  ValueNotifyListenerScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {
                      toggle.value = !toggle.value;
                    },
                    child: Icon(
                      toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                  ),
                  hintText: "password",
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
