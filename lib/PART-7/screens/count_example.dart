import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/PART-5/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: const Text("provider"),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          print("only this build");
          return Text(
            value.count.toString(),
            style: const TextStyle(
              fontSize: 23,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
