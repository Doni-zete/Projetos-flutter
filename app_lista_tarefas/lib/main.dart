import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarefas',
      home: TarefasPage(),
    ),
  );
}

class TarefasPage extends StatefulWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  _TarefasPageState createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  //lista dinâmica para armazenamento das tarefas
  var lista = [];

  var txtTarefa = TextEditingController();

  @override
  void initState() {
    lista.add("Ir ao supermercado");
    lista.add("Comprar ração para o cachorro");
    lista.add("Trocar a lâmpada da cozinha");
    lista.add("Pagar a conta de internet");
    lista.add("Comprar um ventilador novo");
    lista.add("Abastecer o veículo");
    lista.add("Cortar o cabelo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.grey.shade200,

        //
        // ListView
        //
        child: ListView.builder(
          //definir a orientação (horizontal ou vertical)
          scrollDirection: Axis.vertical,

          //definir a quantidade de itens
          itemCount: lista.length,

          //definir a aparência dos itens da lista
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              shadowColor: Colors.blue.shade200,
              child: ListTile(
                //leading: Icon(Icons.task_outlined),
                title: Text(
                  lista[index],
                  style: TextStyle(fontSize: 22),
                ),

                subtitle: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),

                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    //remover um item da lista
                    setState(() {
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Tarefa removida com sucesso'),
                        duration: Duration(seconds: 2),
                      ));
                    });
                  },
                ),

                //selecionar item da lista
                hoverColor: Colors.blue.shade100,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Tarefa selecionada: ${lista[index]}'),
                    duration: Duration(seconds: 2),
                  ));
                },
              ),
            );
          },
        ),
      ),

      //
      // ADICIONAR tarefas
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Adicionar tarefa',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  
                  content: TextField(
                    controller: txtTarefa,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),

                  actions: [
                    TextButton(
                      child: Text('ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
