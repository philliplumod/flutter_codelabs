import 'package:flutter/material.dart';
import 'package:namer/main.dart';
import 'package:namer/state/app_state.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('You have ${appState.favorites.length} favorites'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            title: Text(pair.asLowerCase),
            onTap: () {
              appState.current = pair;
              Navigator.of(context).pop();
            },
          ),
      ],
    );
  }
}
