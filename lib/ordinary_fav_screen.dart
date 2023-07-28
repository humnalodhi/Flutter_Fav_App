import 'package:flutter/material.dart';

class OrdinaryFavScreen extends StatefulWidget {
  const OrdinaryFavScreen({super.key});

  @override
  State<OrdinaryFavScreen> createState() => _OrdinaryFavScreenState();
}

class _OrdinaryFavScreenState extends State<OrdinaryFavScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favourite App')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if(selectedItem.contains(index)){
                        selectedItem.remove(index);
                      }
                      else{
                        selectedItem.add(index);
                      }
                      setState(() {});
                    },
                    title: Text('Item $index'),
                    trailing: Icon(selectedItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  );
                }),
          )
        ],
      ),
    );
  }
}
