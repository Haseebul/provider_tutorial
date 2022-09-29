import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
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
            child: Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.selectedItems.length,
                  itemBuilder: (context, index) {
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
