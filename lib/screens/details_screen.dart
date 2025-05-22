import 'package:examen_final_slenduhhova/models/perro.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Perro perro;
  const DetailsScreen({required this.perro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(perro.nom)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              perro.foto.isNotEmpty
                  ? perro.foto
                  : 'https://i.stack.imgur.com/GNhxO.png',
              height: 200,
            ),
            Text('Descripció: ${perro.id}'),
            Text('Descripció: ${perro.nom}'),
            Text('Descripció: ${perro.descripcio}'),
            Text('Tipus: ${perro.edad}'),
            Text('Restaurant: ${perro.peso}'),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('crearPerro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
