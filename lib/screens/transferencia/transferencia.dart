import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

/// a pasta screen serve para guardar as telas do app
///

/**
The screens folder holds many different folders, each of which corresponds
to a different screen of the app. Each screen folder holds two things: a
 primary screen file which serves to organize each component, and a “components”
 folder which holds each component in its own separate file.
 Any piece of a screen more complicated then a few widgets should be its own component.
 **/


import 'package:flutter/material.dart';

const _titulo_criar_transferecia = 'Criando Transferencia';


class FormularioTransferencia extends StatefulWidget {
  @override
  State createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo_criar_transferecia),
      ),
      body: SingleChildScrollView(
        // esse singlechild serve para colocar um widget q é possivel scrollar,  para caso o cara vire a tela ou coisa do tipo
        child: Column(
          children: [
            Editor(
              controllerCampo: _controllerCampoNumeroConta,
              label: 'Numero da Conta',
              hint: '0000',
            ),
            Editor(
              controllerCampo: _controllerCampoValor,
              label: 'Valor',
              hint: '0000',
              iconData: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final Transferencia transferenciaCriada = Transferencia(
      valor: double.tryParse(_controllerCampoValor.text),
      numeroConta: int.tryParse(_controllerCampoNumeroConta.text),
    );

    //o pop serve para tirar o widget da tela, voltar para a anterior
    //entao ele notifica o widget
    Navigator.pop(context, transferenciaCriada);
  }
}