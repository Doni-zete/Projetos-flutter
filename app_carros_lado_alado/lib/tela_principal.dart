import 'package:app_carros/widget_carros.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        //largura responsiva
        width: MediaQuery.of(context).size.width,

   

        color: Colors.indigo[600],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Carrowidget('Audi', 'Q8', 'lib/imagens/audi_q8.jpg'),
              Carrowidget('Audi', 'R8', 'lib/imagens/audi_r8.jpg'),
              Carrowidget('BMW', 'M2', 'lib/imagens/bmw_m2.jpg'),
              Carrowidget('Ferrari', '488', 'lib/imagens/ferrari_488.jpg'),
              Carrowidget('Lamborghini', 'Huracan',
                  'lib/imagens/lamborghini_huracan.jpg'),
              Carrowidget(
                  'Lamborghini', 'Urus', 'lib/imagens/lamborghini_urus.jpg'),
              Carrowidget('Maserati', 'GTS', 'lib/imagens/maserati_gts.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
