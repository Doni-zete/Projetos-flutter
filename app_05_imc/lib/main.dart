import 'package:flutter/material.dart';
 
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
 
      //
      // TEMA
      //
      theme: ThemeData(
        primaryColor: Colors.purple.shade900,
        backgroundColor: Colors.grey.shade300,
 
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.purple.shade900
          ),
 
          headline2: TextStyle(
            fontSize: 24,
            color: Colors.purple.shade900,
          ),
 
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.purple.shade600,
          ),
        ),
 
      ),
 
      home: TelaPrincipal(),
    ),
  );
}
 
//
// TELA PRINCIPAL
// stf
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);
 
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}
 
class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'), 
        backgroundColor: Theme.of(context).primaryColor, 
 
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              print('botão pressionado');
            }, 
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
 
      backgroundColor: Theme.of(context).backgroundColor,
 
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Icon(
              Icons.people,
              size: 120,
              color: Theme.of(context).primaryColor,
            ),
 
            campoTexto('Peso'),
            campoTexto('Altura'),
 
          ],
        ),
      ),
      
    );
  }
 
  //
  // CAMPO DE TEXTO para entrada de dados
  //
  Widget campoTexto(rotulo){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
 
      child: TextFormField(
 
        style: Theme.of(context).textTheme.headline1,
        
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,

          hintText: "Entre com o valor",
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
 
        ),
      ),
 
    );
  }
 
}

