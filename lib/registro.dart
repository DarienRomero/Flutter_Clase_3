import 'package:clase3/sign_up.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Sign in", style: TextStyle(fontSize: 24, color: Colors.black54))),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Login to your account", style: TextStyle(fontSize: 18, color: Colors.black54))),
              Form(
                child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      right: MediaQuery. of(context). size. width * 0.075,
                      left: MediaQuery. of(context). size. width * 0.075,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => (input == "") ? "Write a password" : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Email'
                      ),
                      onChanged: (input) {
                        email = input;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: MediaQuery. of(context). size. width * 0.075,
                      left: MediaQuery. of(context). size. width * 0.075,
                    ),
                    child: TextFormField(
                      validator: (input) => input.length < 6? "Escriba una contraseña de al menos\n 6 caracteres": null,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Password'
                      ),
                      onChanged: (input) {
                        password = input;
                      }
                    ),
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(
                  right: MediaQuery. of(context). size. width * 0.075,
                ),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecuperarContrasena()
                          )
                        );*/
                      },
                      child: Text(
                        "¿Forgot password?",
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      )
                    ),
                  ],
                ),
              ),
              crearBoton(
                "SIGN IN", Theme.of(context).primaryColor,
                (){}
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text("-------------------------------------or------------------------------------- ",
                    style: TextStyle(
                      color: Colors.black12
                    ),
                  ),
                ),
              ),
              crearBoton(
                "LOGIN WITH GOOGLE", Colors.red[400], 
                (){}
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Don't you have an account? ",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                      Container(
                        height: 20,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp()
                              )
                            );
                          },
                          highlightColor: Colors.blue[300],
                          child: Text("Sign up now ",
                            style: TextStyle(
                              color: Colors.blue
                            ),
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
  Widget crearBoton(String texto , Color color, VoidCallback onPressed ){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ButtonTheme(
        minWidth: MediaQuery. of(context). size. width * 0.6,
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
}