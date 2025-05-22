import 'package:examen_final_slenduhhova/providers/perro_provider.dart';
import 'package:examen_final_slenduhhova/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar los platos cuando la pantalla se inicia.Future.microtask(...): Afegeix la funció a la cua de tasques micro del sistema de planificació de Dart. Aquestes s’executen immediatament després de les operacions actuals (com initState()), però abans que comenci l’esdeveniment següent del bucle principal.
    Future.microtask(
      () => Provider.of<PerroProvider>(context, listen: false).fetchPlats(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final perrosProvider = Provider.of<PerroProvider>(context);
    final perros = perrosProvider.perros;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perros'),
        actions: [
        ],
      ),
      body:
          perros.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: perros.length,
                itemBuilder: (context, index) {
                  final perro = perros[index];
                  return ListTile(
                    title: Text(perro.nom),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(perro: perro),
                        ),
                      );

                    },
                  );
                },
              ),
    );
  }
}
