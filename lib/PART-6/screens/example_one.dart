import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/PART-6/provider/example_one_provider.dart';
//
// class ExampleOne extends StatefulWidget {
//   const ExampleOne({Key? key}) : super(key: key);
//
//   @override
//   State<ExampleOne> createState() => _ExampleOneState();
// }
//
// class _ExampleOneState extends State<ExampleOne> {
//   double value = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AppBar"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Slider(
//               min: 0,
//               max: 1,
//               value: value,
//               onChanged: (val) {
//                 value = val;
//                 setState(() {});
//               }),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.green.withOpacity(value),
//                   ),
//                   child: const Center(
//                     child: Text("Container 1"),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.red.withOpacity(value),
//                   ),
//                   child: const Center(
//                     child: Text("Container 2"),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//////////////////////with provider///////////////////////////

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {


  @override
  Widget build(BuildContext context) {
   //final provider = Provider.of<ExampleOneProvider>(context,listen: false);
   print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(

            builder: (context,value,child){
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);

                  });
            },
          ),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ),
              ],
            );

          })
        ],
      ),
    );
  }
}
