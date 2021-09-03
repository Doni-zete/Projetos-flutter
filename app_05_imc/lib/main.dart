import 'dart:math';
 
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
        focusColor: Colors.purple.shade600,
 
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.grey.shade900
          ),
 
          headline2: TextStyle(
            fontSize: 24,
            color: Colors.grey.shade900,
          ),
 
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade500,
          ),
        ),
 
        //aparência do botão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.green.shade900,
            textStyle: TextStyle(
              fontSize: 24,
            ),
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
 
  //Declaração dos atributos (variáveis) que serão utilizados
  //para controlar os valores informados nos campos de texto
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();
 
  //Declaração da chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();
 
 
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
              // print('botão pressionado');

              setState((){
                formKey.currentState!.reset();
                txtPeso.text ="";
                txtAltura.text ="";
                FocusScope.of(context).unfocus();
              });
            }, 
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
 
      backgroundColor: Theme.of(context).backgroundColor,
 
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Icon(
                Icons.people,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              campoTexto('Peso', txtPeso),
              campoTexto('Altura', txtAltura),
              botao('calcular'),
            ],
          ),
        ),
      ),
      
    );
  }
 
  //
  // CAMPO DE TEXTO para entrada de dados
  //
  Widget campoTexto(rotulo, variavel){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
 
      child: TextFormField(
        
        keyboardType: TextInputType.number,
 
        //Indicar a variável de controle
        controller: variavel,
 
        style: Theme.of(context).textTheme.headline1,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: 'Entre com o valor',
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(12),  
          ),
        ),
 
        //
        // VALIDADOR
        //
        validator: (value){
          value = value!.replaceFirst(',', '.');
          if (double.tryParse(value) == null){
            //não foi possível converter o valor para double
            return 'Entre com um valor numérico';
          }else{
            //a conversão foi realizada com sucesso
            return null;
          }
        },
 
 
 
      ),
    );
  }
 
  //
  // BOTÃO
  //
  Widget botao(rotulo){
    return Container(
      width: 250,
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        child: Text(rotulo),
        onPressed: (){
          //print('botão calcular pressionado!');
 
          //
          // Executar o validador dos Campos de Texto
          //
          if (formKey.currentState!.validate()){
            //O método setState permite a manipulação do estado
            //da UI do App
            setState(() {
              double peso = double.parse(txtPeso.text.replaceFirst(',', '.'));
              double altura = double.parse(txtAltura.text.replaceFirst(',', '.'));
              double imc = peso / pow(altura, 2);
              
              caixaDialogo('IMC: ${imc.toStringAsFixed(2)}');
            });
          }
 
        },
      ),
    );
  }
 
  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Resultado'),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('fechar'),
            ),
          ],
        );
      }
    );
  }
 
}

