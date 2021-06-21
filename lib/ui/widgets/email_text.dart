import 'package:flutter/material.dart';

class EmailText extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: ' Correo electrónico',
          suffix: TextButton(
            onPressed: () => _addEmail(_controller.text),
            child: Text('Enviar'),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
  );

  _addEmail(text){
    //Aqui se debe manejar el correo que el usuario ingresó.
  }
/*
  InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }
*/
}