import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ByteBankApp(),
  ));
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900], //colocar entre [] peso da cor, usar o material.io/design para pegar esses valores( sao os q ficam em cima )
        accentColor: Colors.blue[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[700],
          textTheme: ButtonTextTheme.primary
        ),
      ),
      //o MaterialApp jha tem um padrao para algumas coisas
      home: Scaffold(
        body: ListTransferencia(),
      ), //scaffold eh um design padrao
    );
  }
}







