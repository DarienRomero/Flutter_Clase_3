import 'package:clase3/bloc/bloc_user.dart';
import 'package:clase3/ui/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SignIn(),
      ),
      bloc: UserBloc()
    );
  }
}