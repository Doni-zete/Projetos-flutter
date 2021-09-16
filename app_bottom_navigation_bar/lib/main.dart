import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      home: TelaPrincipal(),
    ),
  );
}

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,

        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],


      ),

    );
  }
}

//
// TELA HOME
//
class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

//
// TELA PESQUISAR
//
class TelaPesquisar extends StatelessWidget {
  const TelaPesquisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade200,
      child: Center(
        child: Text(
          'Pesquisar',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

//
// TELA NOTIFICAÇÕES
//
class TelaNotificacoes extends StatelessWidget {
  const TelaNotificacoes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade200,
      child: Center(
        child: Text('Notificações', style: TextStyle(fontSize: 36)),
      ),
    );
  }
}


//
// TELA CONFIGURAÇÕES
//
class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade200,
      child: Center(
        child: Text('Configurações', style: TextStyle(fontSize: 36)),
      ),
    );
  }
}