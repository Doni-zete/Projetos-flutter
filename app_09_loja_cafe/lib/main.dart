
import 'package:flutter/material.dart';
import 'pages/criar_conta.dart';
import 'pages/inserir_documento.dart';
import 'pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/criar_conta': (context) => const CriarContaPage(),
        '/principal': (context) => const PrincipalPage(),
        '/inserir': (context) => const InserirDocumentoPage(),
      },
    ),
  );
}

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
      ),
    );
  }
}
