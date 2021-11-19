import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:parcial2_flutter/agregar_page.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  // HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, dynamic>? data;
  List postsData=[];

  /////////// TRAYENDO TODA LA DATA GENERAL
  
  getData() async {
    final url = Uri.parse('http://10.0.2.2:2424/Exa02/posts');

    final response = await http.get(url);

    this.data = json.decode(response.body);
    setState(() {
      this.postsData = data!['respuesta'];
      print("EN SETSTATE");
      print(data!['respuesta']);
    });
    print("RESPONSE BODY");
    print(response.body);
  }

  /////////// ELIMINANDO REGISTRO
  
  Future<http.Response> deleteData(int id) async {
    final url = Uri.parse('http://10.0.2.2:2424/Exa02/${id}');

    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    getData();
    return response;
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("INIT STATE EN MAIN.DART !!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item)=> onselected(context,item),
            itemBuilder: (context)=>[
              PopupMenuItem<int>(
                value: 0,
                child: Text("AGREGAR")
              ),
            ]
          )
        ],
      ),
      body: ListView.builder(
        itemCount: postsData.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            // key: ObjectKey(postsData[index]),
            key: UniqueKey(),
            onDismissed: (direction){
              setState(() {
                deleteData(postsData[index]['idpost']);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${postsData[index]['titulo']} Eliminado !')));
              });
            },
            child: GestureDetector(
              
              onTap: (){
                print("ESTE ES EL OBJETO SELECCIONADO: ");
                print("${postsData[index]}");
                final postobjeto = postsData[index];
                print(postobjeto);
                Navigator.pushNamed(context, '/editar', arguments: postobjeto);
              },
          
              child: Card(
                elevation: 15,
                child: ListTile(
                  title: Text("${postsData[index]['titulo']}"),
                  subtitle: Text("${postsData[index]['descripcion']}")
                )
              ),
            ),
          );
        }
      ),
    );
  }
  
  void onselected(BuildContext context, int item){
    switch (item) {
      case 0:
        print("AGREGANDO ...");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AgregarPage())
        );
        break;
        
      default:
    }
  }
}