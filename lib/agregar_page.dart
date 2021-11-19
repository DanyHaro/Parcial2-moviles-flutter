import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parcial2_flutter/post.model.dart';
import 'package:http/http.dart' as http;


class AgregarPage extends StatefulWidget {
  // AgregarPage({Key? key}) : super(key: key);

  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {

  String titulo = '';
  String descripcion = '';
  List<PostModel> postmodel = [];

  /////////// METODO POST /////////
  
  Future<http.Response> createPost(PostModel posts) async {
    final url = Uri.parse('http://10.0.2.2:2424/Exa02/');

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(posts.toJson()));
        // body: json.encode(UsuarioModel.fromJson(user.toJson())));
    
    if (response.statusCode == 200) {
        print(response.body);
    } else {
       print('A network error occurred');
    }

    this.postmodel.add(posts);
    return response;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRAR"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
          _titulo(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _descripcion(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{

              final postObjeto = new PostModel(titulo: this.titulo, descripcion: this.descripcion);
              final dataEnviar = await createPost(postObjeto);
              print(dataEnviar);
              Navigator.pushNamed(context, '/home');
            }
          )
        ],
      ),
    );
  }
  Widget _titulo() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Titulo',
          // suffixIcon: Icon(Icons.fingerprint),
          icon: Icon(Icons.title)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value){
          setState(() {
            this.titulo = value;
          });
      },
    );
  }

  Widget _descripcion() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Descripción',
          icon: Icon(Icons.description)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value){
          setState(() {
            this.descripcion = value;
          });
      },
    );
  }
}