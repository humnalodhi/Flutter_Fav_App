import 'package:flutter/material.dart';
import 'package:flutter_fav_app/Provider/fav_item_provider.dart';
import 'package:flutter_fav_app/Provider%20Screens/my_fav_items_screen.dart';
import 'package:provider/provider.dart';

class FavScreenWithProvider extends StatefulWidget {
  const FavScreenWithProvider({super.key});

  @override
  State<FavScreenWithProvider> createState() => _FavScreenWithProviderState();
}

class _FavScreenWithProviderState extends State<FavScreenWithProvider> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favourite App')),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavItemsScreen()));
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
                itemCount: 100,
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
