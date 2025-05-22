import 'package:examen_final_slenduhhova/models/perro.dart';
import 'package:flutter/material.dart';

class PerroFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Perro tempPerro;

  PerroFormProvider(this.tempPerro);

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }
}