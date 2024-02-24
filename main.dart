import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste de Kawo'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Trois colonnes
          ),
          itemBuilder: (BuildContext context, int index) {
            // Personnalisation des kawos avec des couleurs aléatoires
            return Card(
              color: _randomColor(), // Couleur aléatoire pour chaque kawo
              child: InkWell(
                onTap: () {
                  // Action à effectuer lorsqu'un kawo est cliqué
                  print('Vous avez cliqué sur le kawo numéro $index');
                },
                child: Center(
                  child: ListTile(
                    title: Text(' ===$index==='),
                    subtitle: Text('Karo $index'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Fonction pour générer une couleur aléatoire
  Color _randomColor() {
    return Color.fromRGBO(
      // Utilisation de valeurs aléatoires pour les composantes de couleur
      // pour obtenir une couleur variée pour chaque kawo
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0, // Opacité fixée à 1.0
    );
  }

  final _random = Random();
}