import 'dart:convert';
import 'dart:io';
import 'package:examen_final_slenduhhova/models/perro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerrosService extends ChangeNotifier {
  final String _baseUrl =
      'https://ca453cd8532b5b12fc44.free.beeceptor.com/api/perros/';

  final List<Perro> perros = [];
  late Perro selectedPerros;

  File? newPicture;

  bool isLoading = true;
  bool isSaving = false;

  PerrosService() {
    this.loadProducts();
  }

  Future loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl);
    final resp = await http.get(url);

    final Map<String, dynamic> perrosMap = json.decode(resp.body);

    perrosMap.forEach((key, value) {
      final tempProduct = Perro.fromMap(value);
      tempProduct.id = key;
      perros.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
  }


  Future<String> createPerro(Perro perro) async {
    final url = Uri.https(_baseUrl);
    final resp = await http.post(url, body: perro.toJson());
    final decodedData = json.decode(resp.body);

    perro.id = decodedData['id'];
    this.perros.add(perro);

    return perro.id;
  }

}
