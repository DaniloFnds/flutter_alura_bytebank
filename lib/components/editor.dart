import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controllerCampo;
  final String label;
  final String hint;
  final IconData iconData;

  const Editor(
      {Key key, this.controllerCampo, this.label, this.hint, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      //colocar um padding no component
      child: TextField(
        controller: this.controllerCampo,
        //precisamos desse controler para cada campo, q ele vai conter os valores
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: this.label,
          hintText: this.hint,
          icon: this.iconData != null ? Icon(this.iconData) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}