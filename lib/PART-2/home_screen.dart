import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   int x = 0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("provider tutorials"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              x.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          x++;
          print(x++);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
