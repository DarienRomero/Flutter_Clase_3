import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatefulWidget {
  const Home({
    Key key, 
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _signOut(context) async {
    await _auth.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SignIn();
        },
      ),
    );
  }

  _refreshUser() async {
    FirebaseUser user = await _auth.currentUser();
    await user.reload();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _refreshUser),
          IconButton(
            icon: Icon(Icons.all_out),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Image.network(widget.user.photoUrl),
            ),
            Text("Welcome ${widget.user.displayName}"),
          ],
        ),
      ),
    );
  }
}
