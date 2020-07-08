import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  String username = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          color: Colors.black45
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Sign up", style: TextStyle(fontSize: 24, color: Colors.black54))),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Create an account", style: TextStyle(fontSize: 18, color: Colors.black54))),
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
                      validator: (input) => (input == "") ? "Write an username" : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Username'
                      ),
                      onChanged: (input) {
                        username = input;
                      },
                    ),
                  ),
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
              crearBoton(
                "SIGN UP", Theme.of(context).primaryColor,
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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Already have an account? ",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                      Container(
                        height: 20,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          highlightColor: Colors.blue[300],
                          child: Text("Login",
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