import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> _selected = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Consumer<favourite>(
                        builder: (context, provider, child) {
                      return ListTile(
                        onTap: () {
                          // _selected.add(index);
                          if (provider.selecteditem.contains(index)) {
                            provider.removeItem(index);
                          } else {
                            provider.addItem(index);
                          }

                          // setState(() {});
                        },
                        title: Text('item' + index.toString()),
                        trailing: provider.selecteditem.contains(index)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline),
                      );
                    });
                  }))
        ],
      ),
    );
  }
}
