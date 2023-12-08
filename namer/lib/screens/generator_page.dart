import 'package:flutter/material.dart';
import 'package:namer/main.dart';
import 'package:namer/state/app_state.dart';
import 'package:namer/widgets/big_card.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;

    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('A Random Idea'),
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.toggleFavorite();
                },
                child: Icon(icon),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.generateWord();
                  debugPrint(pair.asLowerCase);
                },
                child: const Text('New Idea'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
