import 'package:flutter/material.dart';

import 'criar_conta.dart';
import 'login.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/criar_conta' : (context) => const CriarContaPage(),
      },
    ),
  );
}