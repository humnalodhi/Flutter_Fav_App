import 'package:flutter/material.dart';
import 'package:flutter_fav_app/Provider/fav_item_provider.dart';
import 'package:flutter_fav_app/Provider%20Screens/fav_screen_with_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavItemProvider(),
      child: MaterialApp(
        title: 'Favourite App with provider',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const FavScreenWithProvider(),
      ),
    );
  }
}
