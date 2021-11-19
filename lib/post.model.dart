// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  
    PostModel({
        this.idpost,
        required this.titulo,
        required this.descripcion,
    });

    int? idpost;
    String titulo;
    String descripcion;

    
    // factory PostModel.fromJson(String str) => PostModel.fromMap(json.decode(str));

    factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        idpost: json["idpost"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
    );

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        idpost: json["idpost"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "idpost": idpost,
        "titulo": titulo,
        "descripcion": descripcion,
    };
}