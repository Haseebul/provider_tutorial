import 'package:flutter/material.dart';
import 'dart:async';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        count++;
        print(count);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Need of provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}',
            style: const TextStyle(fontSize: 24),
          ),
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
