import 'package:flutter/material.dart';

class StateFullWidgetScreen extends StatefulWidget {
  const StateFullWidgetScreen({Key? key}) : super(key: key);

  @override
  State<StateFullWidgetScreen> createState() => _StateFullWidgetScreenState();
}

class _StateFullWidgetScreenState extends State<StateFullWidgetScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //statefull widgets are mutable means we change this
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateTime.now().toString()),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;print(_counter++);
          setState(() {});//disadvantage of stayeful widget
          // (using the setState)
          // ky ye saray widgets rebuild kr raha hai
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
