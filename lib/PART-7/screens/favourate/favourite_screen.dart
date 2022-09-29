import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/PART-7/provider/favourite_provider.dart';
import 'package:provider_tutorial/PART-7/screens/favourate/my_favourite_screen.dart';

//
// class FavouriteScreen extends StatefulWidget {
//   const FavouriteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }
//
// class _FavouriteScreenState extends State<FavouriteScreen> {
//   List<int> selectedIndex = [];
//
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favourite'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () {
//                     selectedIndex.add(index);
//                     setState(() {});
//                   },
//                   title: Text("item$index"),
//                   trailing: selectedIndex.contains(index)
//                       ? const Icon(Icons.favorite)
//                       : const Icon(Icons.favorite_border_outlined),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
///////using provider

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    //final favouriteProvider = Provider.of<FavouriteProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MyFavouriteScreen();
                  },
                ),
              );
            },
            child: Icon(Icons.favorite),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItems(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text("item$index"),
                      trailing: value.selectedItems.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
