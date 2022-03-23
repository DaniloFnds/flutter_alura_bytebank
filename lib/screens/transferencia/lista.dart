/*

StatelessWidgtet é quando temos coisas fixas  q nao alteram,
StatefulWidget é qd precisamos modificar em tempo de exeucacao
 */
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/transferencia.dart';
import 'package:flutter/material.dart';

class ListTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

/*
podemos colocar atributos q serao acessados pelo State, chamando a variavel "widget."
q é o acesso a class q colocamos no generics do State. Mas isso para qd os dados serao fixos e nao serao tao dinamicos

ou podemos passsar no construtor do State o objeto q esta vvindo do stateful

 */
class ListaTransferenciaState extends State<ListTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          return ItemTransferencia(
              transferencia: widget._transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        //esse widget eh aquele botao flutuante q fica embaixo
        onPressed: () {
          // eh obrigatorio esse parametro
          Navigator.push(
            context,
            MaterialPageRoute<Transferencia>(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          ).then((value) {
            _atualiza(value);
          });
        },
        child: Icon(
          Icons.add,
        ), //sempre chamar o child, para colocar algo dentro dele
      ),
    );
  }

  void _atualiza(Transferencia value) {
    if (value != null) {
      setState(() {
        //usar o setstate sempre que precisar atualizar um widget q precisa dos dados, pq apos voltar para o widget anterior, ele nao executa o Builder
        widget._transferencias.add(value);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({Key key, this.transferencia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //cria uma lista
        leading: Icon(Icons.monetization_on),
        title: Text(this.transferencia?.valor.toString()),
        subtitle: Text(this.transferencia?.numeroConta.toString()),
      ),
    );
  }
}
