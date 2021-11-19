import 'package:flutter/material.dart';
import 'package:parcial2_flutter/editar_page.dart';
import 'package:parcial2_flutter/home_page.dart';
import 'package:parcial2_flutter/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/home':(_) => HomePage(),
        '/login':(_) => LoginPage(),
        '/editar':(_) => EditarPage(),
      },
      home: LoginPage(),
    );
  }
}