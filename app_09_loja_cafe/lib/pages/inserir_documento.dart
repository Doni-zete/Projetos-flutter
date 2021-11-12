import 'package:flutter/material.dart';

class InserirDocumentoPage extends StatefulWidget {
  InserirDocumentoPage({Key? key}) : super(key: key);

  @override
  _InserirDocumentoPageState createState() => _InserirDocumentoPageState();
}

class _InserirDocumentoPageState extends State<InserirDocumentoPage> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café Store'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(children: [
          TextField(
            controller: txtNome,
            style: const TextStyle(
                color: Colors.brown, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: txtPreco,
            style: const TextStyle(
                color: Colors.brown, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              labelText: 'Preço',
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: OutlinedButton(
                    child: const Text('salvar'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Container(
                width: 150,
                child: OutlinedButton(
                    child: const Text('cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          )
        ]),
      ),
    );
  }
}