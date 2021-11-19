import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [

              ///////////// FORMULARIO DEL LOGIN

              Container(
                padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
                margin: EdgeInsets.all(20.0),
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    FadeInImage(
                        height: 200.0,
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1200px-User_icon_2.svg.png')),
                    SizedBox(
                      height: 40.0,
                    ),
                    username(),
                    SizedBox(
                      height: 30.0,
                    ),
                    password(),
                    SizedBox(
                      height: 40.0,
                    ),
                    botonIniciarSesion(context),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////////

  Widget username() {
    return Container(
        // margin: EdgeInsets.all(10.0),
        child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // hintText: 'Escriba su usuario',
        labelText: 'Usuario (*)',
        suffixIcon: Icon(Icons.account_circle),
      ),
    ));
  }

  /////////////////////////////////

  Widget password() {
    return Container(
        // margin: EdgeInsets.all(10.0),
        child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // hintText: 'Escriba su usuario',
        labelText: 'Contraseña (*)',
        suffixIcon: Icon(Icons.password),
      ),
    ));
  }

  Widget botonIniciarSesion(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        width: 200.0,
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Iniciar Sesión",
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.login,
                color: Colors.white,
              )
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        color: Color.fromRGBO(24, 150, 156, 1),
      ),
    );
  }
}