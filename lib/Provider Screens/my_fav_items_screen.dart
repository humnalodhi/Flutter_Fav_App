import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/fav_item_provider.dart';

class MyFavItemsScreen extends StatefulWidget {
  const MyFavItemsScreen({super.key});

  @override
  State<MyFavItemsScreen> createState() => _MyFavItemsScreenState();
}

class _MyFavItemsScreenState extends State<MyFavItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favourite App')),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFavItemsScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favProvider.selectedItems.length,
                itemBuilder: (context, index) {
                  return Consumer<FavItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item $index'),
                      trailing: Icon(value.selectedItems.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
