import 'package:examen_final_slenduhhova/models/perro.dart';
import 'package:examen_final_slenduhhova/services/perro_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearPerroScreen extends StatefulWidget {
  const CrearPerroScreen({super.key});

  @override
  State<CrearPerroScreen> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<CrearPerroScreen> {
  late Perro perro;
  late TextEditingController idController;
  late TextEditingController nomController;
  late TextEditingController descripcioController;
  late TextEditingController fotoController;
  late TextEditingController pesoController;
  late TextEditingController edadController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    perro = ModalRoute.of(context)!.settings.arguments as Perro;

    idController = TextEditingController(text: perro.id);
    nomController = TextEditingController(text: perro.nom);
    descripcioController = TextEditingController(text: perro.descripcio);
    fotoController = TextEditingController(text: perro.foto);
    pesoController = TextEditingController(text: perro.peso);
    edadController = TextEditingController(text: perro.edad);
  }

  @override
  Widget build(BuildContext context) {
    final perroService = Provider.of<PerrosService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Perro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'Id'),
            ),
            TextField(
              controller: nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: descripcioController,
              decoration: const InputDecoration(labelText: 'Descripcio'),
            ),
            TextField(
              controller: fotoController,
              decoration: const InputDecoration(labelText: 'Enlace a foto'),
            ),
            TextField(
              controller: pesoController,
              decoration: const InputDecoration(labelText: 'Peso'),
            ),
            TextField(
              controller: edadController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Edad'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updated = Perro(
                  id: idController.text,
                  nom: nomController.text,
                  descripcio: descripcioController.text,
                  foto: fotoController.text,
                  peso: pesoController.text,
                  edad: edadController.text,

                );
                Navigator.pop(context, updated); 
                perroService.createPerro(perro);                              
              }, child: Text("Guardar"),
              
            ),          
          ],
        ),
      ),
    );
  }
}
