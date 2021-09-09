import 'package:flutter/material.dart';

class Carrowidget extends StatelessWidget {
//Atributos
//Os atributos serão utilizados para receber dados
//no momneto da criação do widget

  final String marca;
  final String modelo;
  final String foto;

  //Construtor
  const Carrowidget(this.marca, this.modelo, this.foto, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margins (externo)
      //margin: EdgeInsets.all(50),
      //margin: EdgeInsets.only(top: 50),
      //margin: EdgeInsets.all(bottom: 50),
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),

      //Espaçamento(interno)
      padding: EdgeInsets.all(20),

      width: MediaQuery.of(context).size.width * 0.50,

      // height: 300,

      //Decoração
      decoration: BoxDecoration(
        color: Colors.indigo[900],

        //Bordas
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        //Bordas Arredondadas
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),

      child: Row(
        children: [
          Text(
            this.marca,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[100],
            ),
          ),
          Text(
            this.modelo,
            style: TextStyle(
              fontSize: 28,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple[200],
            ),
          ),

            SizedBox(height: 20,),
          //Foto do carro
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              )
            ),
            child:Image.asset(this.foto, fit: BoxFit. fill)),
        ],
      ),
    );
  }
}
