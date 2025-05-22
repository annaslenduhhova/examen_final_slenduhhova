import 'dart:convert';

class Perro {
    String id;
    String nom;
    String descripcio;
    String foto;
    String edad;
    String peso;

    Perro({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.foto,
        required this.edad,
        required this.peso,
    });

    factory Perro.fromJson(String str) => Perro.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Perro.fromMap(Map<String, dynamic> json) => Perro(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        foto: json["foto"],
        edad: json["edad"],
        peso: json["peso"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "foto": foto,
        "edad": edad,
        "peso": peso,
    };
}
