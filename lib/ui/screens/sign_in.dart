import 'package:clase3/bloc/bloc_user.dart';
import 'package:clase3/ui/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  UserBloc userBloc;
  FirebaseUser user;

  _handleSignIn() async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Home(user: user);
          },
        ),
      );
    }
  }

  

  @override
  void initState() {
    super.initState();
    _handleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text("Sign in",
                      style: TextStyle(fontSize: 24, color: Colors.black54))),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text("Login to your account",
                      style: TextStyle(fontSize: 18, color: Colors.black54))),
              Form(
                  child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      right: MediaQuery.of(context).size.width * 0.075,
                      left: MediaQuery.of(context).size.width * 0.075,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) =>
                          (input == "") ? "Write a password" : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Email'),
                      onChanged: (input) {
                        email = input;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: MediaQuery.of(context).size.width * 0.075,
                      left: MediaQuery.of(context).size.width * 0.075,
                    ),
                    child: TextFormField(
                        validator: (input) => input.length < 6
                            ? "Escriba una contraseña de al menos\n 6 caracteres"
                            : null,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Password'),
                        onChanged: (input) {
                          password = input;
                        }),
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.075,
                ),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecuperarContrasena()
                          )
                        );*/
                        },
                        child: Text(
                          "¿Forgot password?",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
              crearBoton(
                "SIGN IN",
                Theme.of(context).primaryColor,
                () async {
                  if (email.isEmpty || password.isEmpty) return;
                  try{
                    user = await userBloc.signInWithEmailAndPassword(email, password);
                  }catch(error){
                    switch(error.code){
                      case "ERROR_INVALID_EMAIL": { 
                        mensajeError("Correo incorrecto", "Verifica el correo ingresado");
                      } 
                      break;
                      case "ERROR_USER_DISABLED": {
                        mensajeError("Su cuenta está suspendida", "Para más detalles comunícate al correo letstudy.app@gmail.com para poder brindarte más información");  
                      } 
                      break;
                      case "ERROR_USER_NOT_FOUND": { 
                        mensajeError("Usuario no registrado", "Crea una cuenta para poder ingresar");
                      } 
                      break;
                      case "ERROR_WRONG_PASSWORD": { 
                        mensajeError("Contraseña incorrecta", "Vuelve a intentarlo o cambia tu contraseña");
                      } 
                      break;
                      case "ERROR_NETWORK_REQUEST_FAILED": { 
                        mensajeError("Error de conexión", "Verifica si estás conectado a internet o si la conexión es inestable. Luego vuelve a intentarlo");
                      }
                      break;
                      default: { 
                        mensajeError("Error desconocido", "Vuelve a intentarlo más tarde");
                      }
                      break;  
                    }
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Home(user: user);
                      },
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "-------------------------------------or------------------------------------- ",
                    style: TextStyle(color: Colors.black12),
                  ),
                ),
              ),
              crearBoton(
                  "LOGIN WITH GOOGLE", Colors.red[400], () async {
                    user = await userBloc.signInWithGoogle();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Home(user: user);
                        },
                      ),
                    );
                  }),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Don't you have an account? ",
                        style: TextStyle(color: Colors.black38),
                      ),
                      Container(
                        height: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          highlightColor: Colors.blue[300],
                          child: Text(
                            "Sign up now ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget crearBoton(String texto, Color color, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.6,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: RaisedButton(
          color: color,
          onPressed: onPressed,
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
  Future<void> mensajeError(String titulo, String contenido) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return SimpleDialog(
          elevation: 30.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text(titulo, textAlign: TextAlign.center),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                contenido,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
            ),
            crearBoton(
              "Continuar",
              Colors.blue,
              (){
                Navigator.pop(context);
              }
            )
          ]
        );
      }
    );
  }
}
