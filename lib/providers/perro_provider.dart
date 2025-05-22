import 'dart:convert';

import 'package:examen_final_slenduhhova/models/perro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerroProvider with ChangeNotifier {
  final String _baseUrl = 'https://ca453cd8532b5b12fc44.free.beeceptor.com/api/perros/';
  List<Perro> _perros = [];

  List<Perro> get perros => _perros;


  Future<void> fetchPlats() async {
    final url = Uri.parse('$_baseUrl');
    final response = await http.get(url);

    if (response.statusCode != 200) return;

    final Map<String, dynamic> data = json.decode(response.body);
    final List<Perro> listPerros = [];

    data.forEach((key, value) {
      final perro = Perro.fromJson(value);
      listPerros.add(perro);
    });

    _perros = listPerros;
    notifyListeners(); // Notificar a los listeners que los datos han cambiado
  }
}