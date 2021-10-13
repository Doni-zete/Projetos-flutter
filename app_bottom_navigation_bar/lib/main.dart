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
  //Index da tela que será carregada
  var telaAtual = 0;

  //Controlador utilizado na troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: PageView(
        controller: pageController,
        children: [
          TelaHome(),
          TelaPesquisar(),
          TelaNotificacoes(),
          TelaConfiguracoes(),
        ],

        //Mudança de página: quando ocorrer a mudança de página
        //por meio da interação do usuário, é necessário
        //atualizar o valor da variável telaAtual
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),

      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,

        iconSize: 48,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.40),

        selectedFontSize: 16,
        unselectedFontSize: 16,

        //Index do botão selecionado
        currentIndex: telaAtual,

        items: [
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

        //Mudança de página através da interação com os
        //botões do BottomNavigationBar
        onTap: (index) {
          //atualizar o valor da variável telaAtual
          setState(() {
            telaAtual = index;
          });

          //efetuar a troca da página
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
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
  const TelaNotificacoes({Key? key}) : super(key: key);

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
  const TelaConfiguracoes({Key? key}) : super(key: key);

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
